import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class FirebaseFunctions{
  static CollectionReference<TaskModel> getTaskCollection(){
    return FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();
      },);
  }

  static Future<void> addTask(TaskModel task){
    //create Tasks collection
    var collection=getTaskCollection();

    //create document auto id
    var docRef=collection.doc();

    task.id=docRef.id;

    //add attribute to document
    return docRef.set(task);
  }

  static  Stream<QuerySnapshot<TaskModel>> getTask(DateTime data){
    //create Tasks collection
    var collection=getTaskCollection();

    //get task from collection
    //where => filter tasks by the date field
    return collection.where("date",isEqualTo: DateUtils.dateOnly(data).millisecondsSinceEpoch).snapshots();

  }

  static deleteTask(String id){
    var collection=getTaskCollection();
    collection.doc(id).delete();
  }

  
  static editTask(TaskModel task){
    getTaskCollection().doc(task.id).update(task.toJson());
  }

}