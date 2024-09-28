import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/My_provider.dart';

class AddTaskBottomSheet extends StatelessWidget {
  static const String routeName='add';
  AddTaskBottomSheet({super.key});

  @override
  var provider_object=Provider.of<MyProvider>(context);
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        ),
        color:
        //shape: BoxShape.rectangle
      ),
    );
  }
}
