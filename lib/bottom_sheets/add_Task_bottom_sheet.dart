import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/providers/My_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  static const String routeName = "add";

  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
  DateTime selectedDate = DateTime.now();

  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: provider_object.AppTheme == ThemeMode.light
            ? Appcolors.whiteColor
            : Appcolors.secondary_dark,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          Text('addNewTask'.tr(),
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text(
                "addNewTask".tr(),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                  color: Appcolors.grayColor1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Appcolors.blueColor,
                    width: 2
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Appcolors.blueColor,
                    width: 2
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text("description".tr(),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                    color: Appcolors.grayColor1
                ),),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Appcolors.blueColor,
                    width: 2
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Appcolors.blueColor,
                    width: 2
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('selectTime'.tr(),
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            ),
          ), SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              selectDateFun();
            },
            child: Text(selectedDate.toString().substring(0, 10),
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                  color: Appcolors.grayColor1
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 120,
            child: ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),

                    textStyle: Theme
                        .of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                        color: Appcolors.whiteColor
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    backgroundColor: Appcolors.blueColor
                ),
                child: Text("add".tr(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                      color: Appcolors.whiteColor
                  ),)),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  selectDateFun() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
        initialDate: selectedDate,

    builder:
        (context, child) {
      return Theme(data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Appcolors.blueColor,
            onPrimary: Appcolors.whiteColor,
            surface: Appcolors.whiteColor,
            onSurface: Appcolors.blackFontColor,
          )
      ), child:child!
      );
    }
    );
    if(chosenDate!=null)
    {
      selectedDate = chosenDate;
      setState(() {

      });
    }
  }
}