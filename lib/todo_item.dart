import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String name;

  const TodoItem({Key? key, required this.name}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late DateTime createdAt;
  bool? isChecked = false;

  @override
  void initState() {
    super.initState();
    createdAt = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          activeColor: Colors.lightGreen,
          onChanged: (newBool) {
            setState(() {
              isChecked = newBool;
            });
          },
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                widget.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            // Text(
            //   "Il y a $hours",
            // )
          ],
        )
      ],
    );
  }
}
