import 'package:cloud_firestore/cloud_firestore.dart';
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


  static Future<QuerySnapshot<TaskModel>> getTask(){
    var collection=getTaskCollection();
    return collection.get();
  }
}