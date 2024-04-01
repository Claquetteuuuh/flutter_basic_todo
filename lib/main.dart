import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quoicoubehflutter/todo_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  late TextEditingController controller;
  String text = "";

  var todos = [];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: const Text("Today task list"),
        ),
        body: Center(
            child: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            hintText: "Le nom de votre tache"),
                        controller: controller,
                        onSubmitted: (String value) {
                          setState(() {
                            text = controller.text;
                          });
                        }),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                    ),
                    onPressed: () {
                      setState(() {
                        todos.add(controller.text);
                      });
                      controller.clear();
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          "Add it !",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      name: todos[index],
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
