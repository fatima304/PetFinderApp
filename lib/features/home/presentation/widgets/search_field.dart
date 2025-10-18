import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routes/routes.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final bool isClickable; 

  const SearchTextField({
    super.key,
    this.controller,
    this.onSubmitted,
    this.isClickable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isClickable) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.searchScreen);
        },
        child: AbsorbPointer(
          child: _buildTextField(context),
        ),
      );
    } else {
       return _buildTextField(context);
    }
  }

  Widget _buildTextField(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: !isClickable,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        hintText: 'Search cat breeds...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
