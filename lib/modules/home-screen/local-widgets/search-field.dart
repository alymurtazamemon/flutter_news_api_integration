import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  SearchField({
    this.onPressed,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: IconButton(
          padding: EdgeInsets.all(0),
          onPressed: onPressed,
          icon: Icon(Icons.search, size: 18),
        ),
        hintText: "Search your topic...",
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
