import 'dart:math';

import 'package:flutter/material.dart';
import '../../Data/models/todo_list.dart';

class AddTask extends StatelessWidget {
  final Todo tasks;
  const AddTask({super.key, required this.tasks});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child:Stack(
            children: [
              Container(
                  width:180,height:350,
                  padding: const EdgeInsets.all(11),
                  margin:const EdgeInsets.all(20),
                  decoration:const BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(10),
                      topLeft:Radius.circular(10),
                      topRight:Radius.circular(10)
                  )
              ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(tasks.todo,
                      style: const TextStyle(fontSize: 15,)
                  ),
                ),
              ),
              Positioned(bottom: 30,left:40,
                  child: Row(
                    children: [
                      const Text('Stutus: '),
                      tasks.completed
                        ? const Text('Done',style: TextStyle(fontWeight: FontWeight.w900))
                        : const Text('On going',style: TextStyle(fontWeight: FontWeight.w900)),
              ],
                  ),
                ),
              //SizedBox(height:10),
              Positioned(top:30,right:35,
                child: Container(width:10,height:10,
                  decoration: BoxDecoration(color: Color(Random().nextInt(0xffff0000)),
                      borderRadius:const BorderRadius.all(Radius.circular(100)
                    )
                ),
                ),
              ),
              Positioned(right: 20,bottom: 40,
              child:
              Container(width: 25,height: 30,
                decoration: const BoxDecoration(color:Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                  bottomLeft:Radius.circular(10),
                  topLeft:Radius.circular(10),),
              ),child: Center(
                    child: Text(tasks.id.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w900),)
                ),
              ),
              ),
            ],
          )
      );
  }
}

