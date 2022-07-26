import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String userName;
  final String taskSize;
  final String taskText;

  Task({
    required this.userName,
    required this.taskSize,
    required this.taskText,
  });

  Task.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  )   : userName = snapshot.data()?['userName'],
        taskSize = snapshot.data()?['taskSize'],
        taskText = snapshot.data()?['taskText'];

  Map<String, dynamic> toFirestore() {
    return {
      "userName": userName,
      "taskSize": taskSize,
      "taskText": taskText,
    };
  }
}
