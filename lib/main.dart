import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List todo = [];
  String temp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToDo List')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add To List'),
                    content: TextField(
                      onChanged: (value) {
                        temp = value;
                      },
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if (temp.isNotEmpty) {
                                todo.add(temp);
                              }
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.green),
                          ))
                    ],
                  );
                });
          },
          child: Icon(Icons.add)),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (context, index) {
            return Dismissible(
                onDismissed: (diraction) {
                  setState(() {
                    todo.removeAt(index);
                  });
                },
                background: Container(
                  color: Colors.red,
                ),
                key: Key(todo[index]),
                child: Card(
                    color: Colors.grey,
                    child: ListTile(
                      title: Text(todo[index]),
                    )));
          }),
    );
  }
}
