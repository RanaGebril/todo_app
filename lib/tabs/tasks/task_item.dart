import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/providers/My_provider.dart';

class TaskItem extends StatefulWidget {
  TaskModel task;
  TaskItem({required this.task,super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var provider_object=Provider.of<MyProvider>(context);
    return Slidable(
      startActionPane: ActionPane(motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.deleteTask(widget.task.id);
                setState(() {

                });
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
      child: Container(
        decoration: BoxDecoration(
          color: provider_object.AppTheme == ThemeMode.light
              ? Appcolors.whiteColor
              : Appcolors.secondary_dark,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:Row(
            children: [
              Container(
                height: 80,
                width: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Appcolors.blueColor,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.title,
                      style: Theme.of(context).textTheme.displayLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.task.subTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Icon(
                  Icons.done,
                  color: Appcolors.whiteColor,
                  size: 25,
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
