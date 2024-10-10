import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();
      },
    );
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime data) {
    var collection = getTaskCollection();
    return collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("date",
            isEqualTo: DateUtils.dateOnly(data).millisecondsSinceEpoch)
        .snapshots();
  }

  static void deleteTask(String id) {
    var collection = getTaskCollection();
    collection.doc(id).delete();
  }

  static void editTask(TaskModel task) {
    getTaskCollection().doc(task.id).update(task.toJson());
  }

  static void createAcount(String emailAddress, String password,
      {required Function onSuccess,
      required Function(String) onError,
      required String userName,
      required String phone,
      required int age}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user?.sendEmailVerification();
      UserModel user = UserModel(
          userName: userName,
          email: emailAddress,
          phone: phone,
          age: age,
          id: credential.user!.uid);
      addUser(user);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message ?? "Unknown error occurred.");
    } catch (e) {
      onError(e.toString());
    }
  }

  static void logIn(String emailAddress, String password,
      {required Function onSuccess, required Function(String) onError}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // Check if the user exists and their email is verified
      if (credential.user != null) {
        if (credential.user!.emailVerified) {
          onSuccess();
        } else {
          onError("Please verify your email before logging in.");
        }
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message ?? "Unknown error occurred.");
    } catch (e) {
      onError(e.toString());
    }
  }

  /////////////////////////////////users/////////////////////////
  static CollectionReference<UserModel> getUsersColletion() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(fromFirestore: (snapshot, _) {
      return UserModel.fromJson(snapshot.data()!);
    }, toFirestore: (User, _) {
      return User.toJson();
    });
  }

  static void addUser(UserModel user) {
    var collection = getUsersColletion();
    // id from auth
    var docRef = collection.doc(user.id);
    docRef.set(user);
  }
}
