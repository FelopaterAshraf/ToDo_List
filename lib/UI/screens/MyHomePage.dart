import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_2_task2/UI/Widget/AddTask.dart';
import '../../Data/models/todo_list.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   Future<List<Todo>> getData() async {
     final response = await http.get(Uri.parse('https://dummyjson.com/todos'));
     List<Todo> tasks = [];

      if (response.statusCode == 200) {
           var jsonResponse =
               convert.jsonDecode(response.body) as Map<String, dynamic>;
           for (var item in jsonResponse['todos']) {
             tasks.add(Todo.fromJson(item));
           }
         }
     return tasks ;
   }
    List<Todo> tasks =[];

        @override
        void initState() {
          Future.delayed(Duration.zero, () async {
            var data = await getData();
            setState(() {
              tasks = data;
            });
          });
          super.initState();
        }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.inactiveGray,
      body: SafeArea( 
          child: GridView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return AddTask(tasks: tasks[index]);
            },
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2 ,
              ),
          ),
      ),

    );
  }
}
