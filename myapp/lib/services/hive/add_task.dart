import 'package:flutter/material.dart';
import './../../models/models.dart';
import 'hive.dart';

class AddTask {
   static void addTask(TextEditingController titleController,
      TextEditingController descriptionController) {
     HiveConfig.taskBox.put("key_${titleController.text}",
        TaskModel(
            title: titleController.text,
            description: descriptionController.text,
            isCompleted: true));
  }
}
