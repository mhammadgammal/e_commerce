import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key,
      this.searchWidth = 258.0,
      required this.searchController,
      required this.onSearchFieldPressed});

  final TextEditingController searchController;
  final void Function() onSearchFieldPressed;
  final double searchWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: SizedBox(
            width: searchWidth,
            height: 40.0,
            child: TextField(
              controller: searchController,
              maxLines: 1,
              enabled: false,
              decoration: InputDecoration(
                // labelText: 'Search',
                hintText: 'What Are you Looking for?',
                contentPadding: const EdgeInsetsDirectional.only(top: 5.0),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
