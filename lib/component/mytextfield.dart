// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Icon ? icon;
  final TextInputType textType;
  TextEditingController controller;
  MyTextField(
      {super.key,
        required this.hintText,
        required this.obscureText,
        required this.controller,
        required this.icon,
        required this.textType,

      });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.5),
        child: TextField(
          obscureText: obscureText,
          controller: controller,
            keyboardType:textType,
          decoration: InputDecoration(
            //icon: Icon(icon?.icon),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary)),
              fillColor: Theme.of(context).colorScheme.secondary,
              filled: true,
              hintText: hintText,
              hintStyle:
              TextStyle(color: Theme.of(context).colorScheme.primary)),
        ));
  }
}
