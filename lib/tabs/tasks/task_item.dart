import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/providers/My_provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object=Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: provider_object.AppTheme == ThemeMode.light
            ? Appcolors.whiteColor
            : Appcolors.secondary_dark,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 115,
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {

                },
                backgroundColor: Appcolors.redColor,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)
                ),
                padding: EdgeInsets.zero,
                autoClose: true,
              ),
              SlidableAction(
                onPressed: (context) {

                },
                backgroundColor: Appcolors.blueColor,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
                autoClose: true,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Appcolors.blueColor,
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Title",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Task Description",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
              Spacer(),
              ElevatedButton(onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.blueColor,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )

                  ),
                  child: Icon(Icons.done,
                    color: Appcolors.whiteColor,
                    size: 25,)
              )
            ],
          ),
        ),
      ),
    );
  }
}
