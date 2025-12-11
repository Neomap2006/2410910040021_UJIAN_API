import 'package:flutter/material.dart';
import '../services/api_service.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List todos = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  void loadTodos() async {
    var data = await ApiService.getUserTodos();
    setState(() {
      todos = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List User")),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                var item = todos[index];
                return ListTile(
                  title: Text(
                    item["todo"],
                    style: TextStyle(
                      color: item["completed"] ? Colors.green : Colors.red,
                    ),
                  ),
                  trailing: Icon(
                    item["completed"] ? Icons.check : Icons.close,
                    color: item["completed"] ? Colors.green : Colors.red,
                  ),
                );
              },
            ),
    );
  }
}