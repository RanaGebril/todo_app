import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/providers/My_provider.dart';

class DialogUi extends StatelessWidget {
  var message;

  DialogUi({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return AlertDialog(
      backgroundColor: provider_object.AppTheme == ThemeMode.light
          ? Appcolors.whiteColor
          : Appcolors.secondary_dark,
      title: Text(
        "error".tr(),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: provider_object.AppTheme == ThemeMode.light
                ? Appcolors.blackFontColor
                : Appcolors.whiteColor),
      ),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "back".tr(),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Appcolors.whiteColor),
          ),
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Appcolors.blueColor)),
        ),
      ],
    );
  }
}
