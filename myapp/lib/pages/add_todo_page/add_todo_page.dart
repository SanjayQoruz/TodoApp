import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';
import 'package:myapp/services/hive/add_task.dart';
import 'package:myapp/services/hive/delete_task.dart';
import '../../services/services.dart';

// ignore: must_be_immutable
class AddTodoPage extends StatefulWidget{
     TaskModel ?model;
     bool isEdit;
     AddTodoPage({super.key,required this.model,required this.isEdit});
     @override
     State<AddTodoPage> createState()=> _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage>{
      TextEditingController titleController = TextEditingController();
      TextEditingController descriptionController = TextEditingController();
      TaskModel? currTask;
      @override
      void initState(){
        super.initState();
      }
      @override
      Widget build(BuildContext context){
           if(widget.isEdit){
              titleController.text = widget.model!.title;
              descriptionController.text = widget.model!.description;
              DeleteTask().delete("key_${titleController.text}");
           }
           return Scaffold(
              appBar:AppBar(
                  title:const Text("Add Todo"),
              ),
              body:ListView(
                padding:const EdgeInsets.all(6),
                children: [
                        TextField(
                        controller:titleController,
                        style:const TextStyle(
                          fontSize:25,
                         ),
                          decoration:const InputDecoration(
                              hintText:'title',
                              hintStyle: TextStyle(
                                  fontSize:20
                              )
                          ),
                          cursorColor: Colors.grey,
                          
                     ),
                      const SizedBox(height:20,),
                       TextField(
                        controller: descriptionController,
                      style:const TextStyle(
                          fontSize:25,
                      ),
                      cursorColor:Colors.grey,
                          decoration:const InputDecoration(
                              hintText:'description',
                              hintStyle: TextStyle(
                                  fontSize:20
                              ),
                          ),
                          minLines:5,
                          maxLines:10,
                          keyboardType: TextInputType.multiline,
                     ),
                     const SizedBox(height:30,),
                     ElevatedButton(
                      style:const ButtonStyle(
                           backgroundColor:MaterialStatePropertyAll(
                             Colors.blueAccent
                           ),
                      ),
                      onPressed: ()=>{
                          createTask(),
                          Navigator.pop(context)
                      },
                       child:const Text(
                        "submit",
                        style: TextStyle(
                             color: Colors.black,
                             fontSize:30,
                             fontStyle: FontStyle.italic
                        ),
                       )

                     )
                ],
              )
           );
      }

      void createTask(){
            if(titleController.text=='' || descriptionController.text==''){
                showMessageWidget('Enter all fields');
                return;
            }
            AddTask.addTask(titleController, descriptionController);
            currTask= HiveConfig.taskBox.get('key_${titleController.text}')!;
            if(currTask!.isCompleted){
                  showMessageWidget('TaskCreated Successfully');
            }
      }
      void showMessageWidget(String message){
          titleController.text= '';
          descriptionController.text = '';
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
}