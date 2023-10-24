import 'package:flutter/material.dart';
import 'package:practice/style.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>? toDoList = ["Test", "1", "2"];
  String? content = "";

  late double _height, _width;
  List<MaterialColor>? getColor = [Colors.red, Colors.red, Colors.red];

  List<bool>? isColor = [false, false, false];

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    _addItemToList(content) {
      setState(() {
        toDoList!.add(content);
        isColor!.add(false);
        getColor!.add(Colors.red);
        content = "";
      });
    }

    _deleteItemFromList(index) {
      setState(() {
        toDoList!.removeAt(index);
        isColor!.removeAt(index);
        getColor!.removeAt(index);
      });
    }

    _editItemFromList(index) {
      String changeContent = "";
      //To DO
    }

    _doneItemFromList(index) {
      if (isColor![index] == false) {
        getColor![index] = Colors.green;
        isColor![index] = true;
      } else {
        getColor![index] = Colors.red;
        isColor![index] = false;
      }
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
        backgroundColor: Colors.amber,
        toolbarHeight: _height * 0.15,
        foregroundColor: Colors.black,
      ),
      // backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: TextField(
                      onChanged: (value) {
                        content = value;
                      },
                      decoration: AppInputDecoration(
                          label: "Enter Task!", hint: "Write here!!"),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: ElevatedButton(
                      onPressed: () => _addItemToList(content),
                      child: const Text("Submit"),
                      style: appButtonStyle(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 70,
              child: ListView.builder(
                itemCount: toDoList!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox50(
                      Row(
                        children: [
                          Expanded(
                            flex: 65,
                            child: Text(
                              '${toDoList![index]}',
                              style: TextStyle(
                                decoration: isColor![index]==true ? TextDecoration.lineThrough : null,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: TextButton(
                              onPressed: () => _doneItemFromList(index),
                              child: Icon(Icons.done_all_rounded,
                                  color: getColor![index]),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: TextButton(
                              onPressed: () => _editItemFromList(index),
                              child: const Icon(Icons.edit,
                                  color: Colors.deepPurple),
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: TextButton(
                              onPressed: () => _deleteItemFromList(index),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
