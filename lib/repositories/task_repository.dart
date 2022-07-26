import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/task.dart';

class TaskRepository {
  CollectionReference<Map<String, dynamic>> taskCollection =
      FirebaseFirestore.instance.collection("tasks");

  Future<List<Task>> getTasks() async {
    var collection = await taskCollection.get();
    List<Task> tasks = [];
    for (var doc in collection.docs) {
      tasks.add(Task.fromFirestore(doc));
    }
    // Sort tasks here if need be

    return tasks;
  }

  // getSingleTask()

  Future<void> uploadTask({required Task task}) async {
    await taskCollection.add(task.toFirestore());
  }

  Future<void> updateTask({required Task task, required String id}) async {
    await taskCollection.doc(id).set(task.toFirestore());
  }

  Future<void> deleteTask({required String id}) async {
    await taskCollection.doc(id).delete();
  }
}
