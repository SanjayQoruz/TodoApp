import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';
import './../../styles/styles.dart';

// ignore: must_be_immutable
class ViewPage extends StatefulWidget{
  ViewPage({super.key,required this.viewTask});

  TaskModel viewTask;
  @override
  State<ViewPage>createState()=>_ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
    @override
    Widget build(BuildContext context){
     TaskModel model = widget.viewTask;
        return Scaffold(
             appBar: AppBar(
                  title:const Text("View Task"),
                  titleTextStyle:BigFont.primary
             ),
              body: Column(
                  children: [
                    Container(
                          margin:const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                               color:AppColor.noteColor,
                               borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      model.title,
                                      style:MediumFont.primary
                                    ),
                                    const Text(
                                      "🙌",
                                      style:TextStyle(
                                          fontSize: 30
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height:20,),
                                 Container(
                                    margin:const EdgeInsets.all(20),
                                    child: Text(
                                      model.description,
                                      style:SmallFont.primary
                                    ),
                                  ),
                              ],
                          ),
                      ),
                  ],
                ),
              );
    }
}