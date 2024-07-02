import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_cubit_state.dart';

class RegisterCubitBloc extends Cubit<RegisterCubitState> {
  RegisterCubitBloc() : super(RegisterCubitInitial()) {
    
  }
}
