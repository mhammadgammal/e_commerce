# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

A Flutter e-commerce app (`student.valuxapps.com` API backend) that the owner uses as a personal sandbox for practicing Flutter tools/patterns ("I will put in it most tools and skills I learnt" — see README.md). Expect some inconsistency between features as a result — treat existing feature folders as examples, not always as the canonical pattern.

## Commands

```bash
flutter pub get                     # install dependencies
flutter run                         # run on connected device/emulator
flutter analyze                     # static analysis (flutter_lints, see analysis_options.yaml)
flutter test                        # run all tests
flutter test test/widget_test.dart  # run a single test file
dart run build_runner build --delete-conflicting-outputs   # regenerate Hive adapters (*.g.dart)
```

There is only one test file (`test/widget_test.dart`, the default counter-app boilerplate — not representative of app behavior). No test infrastructure exists for features yet.

Firebase is wired up via `firebase.json` / `lib/firebase_options.dart` (project `e-commerce-510a3`) for `firebase_auth` (email/password + Google Sign-In) and `firebase_core`.

## Architecture

### Layered, feature-first structure

Code lives under `lib/features/<feature>/` (authentication, home, categories, cart, favorite, profile, boarding) plus `lib/core/` for cross-cutting concerns. Each feature follows the same three-layer split:

- **`data/`** — `network/*_api_service.dart` (raw Dio calls to `ApiEndPoints`), `repositories/*_repository_impl.dart` (implements the domain repo interface, parses `Response.data` into models, does not throw — catches errors and returns null/false/Either instead).
- **`domain/`** — `entity/` (response/model classes with `fromJson`), `repository/*_repository.dart` (abstract interface), `usecase/` (one class per use case implementing `BaseUsecase<T>` or `BaseAuthUseCase`, injected with the repo impl directly, not the interface — see below).
- **`presentation/`** — `cubit/` (flutter_bloc `Cubit` + sealed state classes), `screen/`, `widgets/`.

Note: usecases and cubits are typically constructed with the concrete `*RepositoryImpl` type (e.g. `LoginUsecase(sl.get())` resolves `AuthenticationRepositoryImpl` from DI), not the abstract repository — the interfaces exist but aren't consistently used as the injected type.

### Dependency injection (`lib/core/di/di.dart`)

`get_it` service locator (`sl`), initialized once in `init()` (called from `main()` before `runApp`). Registrations are grouped by region comment (`// #region X`) per concern: Localization, SharedPreferences, database (Hive), Dio, then one block per feature registering its api service + repository impl as lazy singletons. Only a few usecases/cubits (`HomeCubit`, home/cart/favorite usecases) are pre-registered in DI — most usecases and cubits for other features are constructed ad hoc at the point of use (usually in `AppRouter` or `AppCubit.screens`) by pulling their repo dependency from `sl`.

When adding a new feature, follow the existing `#region` grouping convention in `di.dart` rather than introducing a different registration style.

### Navigation

Two-level routing:
- `lib/core/router/router_helper.dart` — route name constants.
- `lib/core/router/app_router.dart` — `AppRouter.generateRoute`, a `Map<String, WidgetBuilder>` passed to `MaterialApp.routes`. Each entry wraps its screen in the `BlocProvider`(s) it needs, constructing the cubit and its usecases inline. Routes needing arguments read them via `ModalRoute.of(context)!.settings.arguments` cast to a specific type/record (e.g. `(int, ProductModel)` for product details).

The app root (`RouterHelper.root`) renders `AppLayout`, a `BottomNavigationBar` + `IndexedStack` shell whose 4 tabs (Home, Categories, Profile, Cart) are defined as `(icon, label, screen)` records in `AppCubit.screens` (`lib/core/app/cubit/app_cubit.dart`) — each tab screen is independently wrapped with the `BlocProvider`s it needs, matching the same pattern as `app_router.dart`.

`e_commerce.dart` (`ECommerceApp`) picks the `initialRoute` at startup based on cached state: no `isBoarding` flag → onboarding; else has `token` → root; else → login.

### State management

`flutter_bloc` `Cubit`s throughout (no full `Bloc`/events). Each cubit's state file (`*_state.dart`) is a `part of` the cubit file. `EcommerceBlocObserver` (`lib/bloc_observer.dart`) is set as the global `Bloc.observer` and logs create/change/error/close to stdout — useful for tracing cubit activity when debugging.

Cross-cutting state that needs to be shared without a `BlocProvider` in scope (e.g. the cart badge count shown on the bottom nav) goes through global `ValueNotifier`s in `lib/core/notifiers/notifiers.dart` (`cartItemsCounter`, `cartItemsNotifier`, `cartItemsId`) rather than bloc state — check there before assuming cart state only lives in `CartCubit`.

### Networking

`DioHelper` (`lib/core/utils/api_utils/dio_helper.dart`) wraps a single injected `Dio` instance with `baseUrl` and default headers (including `Authorization` from cached token) set once at construction in DI — the header is **not** refreshed after login, so a token saved after `DioHelper` is built won't retroactively appear in headers unless this is handled. Endpoints are centralized in `lib/core/utils/api_utils/api_end_points.dart`. Per-feature `*_api_service.dart` classes call `DioHelper` directly and return raw `Response`; parsing into models happens one layer up in the repository impl.

### Persistence

Two separate mechanisms, not unified:
- `SharedPreferences` via `CacheHelper` (`lib/core/cache/cache_helper.dart`) + key constants in `lib/core/cache/cache_keys.dart` — used for token, onboarding flag, language code, etc.
- `Hive` via `DbHelper` (`lib/core/database/db_helper.dart`, static helper around `sl<HiveInterface>()`) — used for structured local storage, currently the logged-in `UserModel` (`lib/core/data/user_model.dart`, has a generated `.g.dart` Hive adapter registered in DI as adapter 0). Regenerate `*.g.dart` files with `build_runner` after changing any `@HiveType`-annotated model.

### Localization

Custom (not `intl`-generated) `AppLocalizations` (`lib/core/utils/localization/app_localization.dart`) loads JSON string tables from `assets/localizations/<lang>.json` via a `LocalizationsDelegate`. Current locale is tracked separately by `AppLanguage` (a `ChangeNotifier` registered in DI as a lazy singleton and also read via `sl<AppLanguage>().appLocal` for `MaterialApp.locale`), persisted to `SharedPreferences` under `language_code`. Supported locales/delegates are declared in `lib/core/utils/localization/localize_constants.dart`.

### Theming / responsive layout

`flutter_screenutil` (`ScreenUtilInit`, design size 390×844) wraps the whole app in `e_commerce.dart` for responsive sizing (`.w`, `.h`, `.sp` extensions used throughout widgets). `AppTheme` / `AppColors` / `AppTextStyle` under `lib/core/theme/` centralize the Material theme; only a light theme is defined.
