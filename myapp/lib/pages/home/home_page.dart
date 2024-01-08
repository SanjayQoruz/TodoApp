import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/services/hive/delete_task.dart';
import 'package:myapp/services/services.dart';
import '../../models/models.dart';
import './../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSearchSelected = false;
  TextEditingController searchController =TextEditingController();
  TaskModel? searchList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:isSearchSelected?
        IconButton(onPressed: ()=>{
            setState(()=>isSearchSelected=false)
        }, icon:const Icon(
              Icons.cancel,
              color:Colors.black,
              size:35,
          ))
        :IconButton(
            onPressed: ()=>{
               setState(()=>isSearchSelected=true)
            },
            icon: const Icon(
              Icons.search,
              color:Colors.black,
              size:35,
            ),
        ),
        title:isSearchSelected?Container(
          margin: const EdgeInsets.only(bottom:20),
          decoration:const BoxDecoration(
              border: Border(bottom:BorderSide(color: Colors.black))
          ),
          child: TextField(
              onChanged: (value) => setState(()=>searchController.text=value),
              controller:searchController,
              cursorColor:Colors.black,
              cursorHeight:50,
               style:const TextStyle(
                  color: Colors.black,
                  fontSize:30
               ),
                decoration:const InputDecoration(
                     hintText:"Search.....",
                     hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize:20
                     ),
                ),
          ),
        ):
        const Text(
          "Todo App",
          style:TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic)
        ),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: HiveConfig.taskBox.listenable(),
            
            builder: (context, Box box, child) {
              List<TaskModel> tasks = box.values.cast<TaskModel>().toList();
              if (isSearchSelected && searchController.text.isNotEmpty) {
                tasks = tasks.where((task) {
                  return task.title.toLowerCase().contains(
                        searchController.text.toLowerCase(),
                      ) ||
                      task.description.toLowerCase().contains(
                        searchController.text.toLowerCase(),
                      );
                }).toList();
              }
              return Flexible(
                flex: 3,
                child:tasks.isEmpty?
                const Center(
                    child: Text(
                      "No Task Found",
                      style: TextStyle(
                          fontSize:30,
                          fontStyle: FontStyle.italic,
                          color: Colors.black
                      ),
                    ),
                )
                :Container(
                  
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      TaskModel? task = tasks[index];
                      String description = modString(task.description);
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.2, 0.2),
                                blurRadius: 1)
                          ],
                        ),
                        child: ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ViewPage(viewTask: task))),
                            leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text(
                                  "$index",
                                  style: const TextStyle(color: Colors.white),
                                )),
                            title: Text(
                              task.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              description,
                              overflow: TextOverflow.fade,
                            ),
                            trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () => {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddTodoPage(
                                                              model: task,
                                                              isEdit: true)))
                                            },
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () => {
                                              DeleteTask()
                                                  .delete("key_${task.title}")
                                            },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  ],
                                ))),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {navigateToTodoPage()},
        label: const Text(
          "Add Task",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  void navigateToTodoPage() {
    final route = MaterialPageRoute(
        builder: (context) => AddTodoPage(model: null, isEdit: false));
    Navigator.push(context, route);
  }

  String modString(String str) {
    if (str.length <= 10) {
      return str;
    }
    String s = str.substring(0, 10);
    return "$s...";
  }
}
