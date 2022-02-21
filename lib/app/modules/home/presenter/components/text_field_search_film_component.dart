// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFieldSearchFilmComponent extends StatelessWidget {
  const TextFieldSearchFilmComponent({
    Key? key,
    //  required this.controller,
  }) : super(key: key);

  final double height = 47;
  // final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xFFF1F3F5),
      ),
      child: TextField(
        // controller: controller,
        style: Theme.of(context).textTheme.caption,
        cursorColor: Theme.of(context).primaryColor,
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          icon: Icon(Icons.search_rounded, color: Color(0xFF5E6770)),
          border: InputBorder.none,
          hintText: 'Pesquise filmes',
          hintStyle: TextStyle(color: Color(0xFF5E6770)),
        ),
      ),
    );
  }
}
