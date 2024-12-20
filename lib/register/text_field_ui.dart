import 'package:flutter/material.dart';
import 'package:todo_app/AppColors.dart';

class TextFieldUi extends StatelessWidget {
  var formController;
  String lable;
  var keyboardtype;
  String? Function(String?)? validator;

  TextFieldUi(
      {required this.formController,
      required this.lable,
      this.keyboardtype,
        this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextFormField(
          controller: formController,
          keyboardType: keyboardtype,
          validator: validator,
          style: Theme.of(context).textTheme.labelMedium,
          decoration: InputDecoration(
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
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
