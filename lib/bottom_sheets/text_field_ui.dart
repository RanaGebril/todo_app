import 'package:flutter/material.dart';
import 'package:todo_app/AppColors.dart';

class TextFieldUi extends StatelessWidget {
  String label;

  TextFieldUi({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        label: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Appcolors.grayColor1,
              ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Appcolors.blueColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Appcolors.blueColor, width: 2),
        ),
      ),
      cursorColor: Appcolors.grayColor1,
    );
  }
}
