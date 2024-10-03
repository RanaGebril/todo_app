import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/providers/My_provider.dart';
import 'package:todo_app/tabs/tasks/task_item.dart';

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
        FutureBuilder(
          future: FirebaseFunctions.getTask(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Appcolors.blueColor));


            } else if (snapshot.hasError) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "errorMessage".tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("tryAgain".tr()))
                ],
              );
            }

            //convert from list of type ... to list of task model
            //e => each single task,doc
            var tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            if (tasks.isNotEmpty) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return TaskItem(task: tasks[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: tasks.length),
                ),
              );
            }
            else {
              return Center(
                child: Text(
                  "noTasks".tr(),
                   style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }
          },
        )
      ],
    );
  }
}
