import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const SearchBar({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
