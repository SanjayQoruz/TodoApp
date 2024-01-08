import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';

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
                  titleTextStyle:const TextStyle(
                    color:Colors.black,
                    fontSize:30,
                    fontStyle: FontStyle.italic,
                    fontWeight:FontWeight.w700,
                  ),
             ),
              body: Column(
                  children: [
                    Container(
                          margin:const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                               color:Color(0xffA7FEEA),
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
                                      style:const TextStyle(
                                         fontStyle: FontStyle.italic,
                                         fontWeight: FontWeight.w700,
                                         fontSize: 30,
                                         letterSpacing:2
                                      ),
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
                                    margin: EdgeInsets.all(20),
                                    child: Text(
                                      model.description,
                                      style:const TextStyle(
                                         fontStyle: FontStyle.italic,
                                         fontWeight: FontWeight.w700,
                                         fontSize: 15,
                                         letterSpacing:2
                                      ),
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