import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/providers/My_provider.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Appcolors.blueColor,
          activeDayColor: Appcolors.whiteColor,
          activeBackgroundDayColor: Appcolors.blueColor,
          dotColor: Colors.redAccent[100],
          locale: context.locale.languageCode,
          fontSize: 25,
          height: MediaQuery.of(context).size.height * 0.12,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
                itemBuilder: (context, index) {
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
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemCount: 30),
          ),
        )
      ],
    );
  }
}
