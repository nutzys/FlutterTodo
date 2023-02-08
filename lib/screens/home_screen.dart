import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_v1/providers/task_provider.dart';
import 'package:todo_v1/screens/add_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Text('Add'),
      ),
      body: ListView.builder(
          itemCount: Provider.of<TaskProvider>(context).allTasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    task.removeTask(task.allTasks[index]);
                  });
                },
              ),
              title:
                Text(Provider.of<TaskProvider>(context).allTasks[index].name),
              trailing: Checkbox(
                value: task.allTasks[index].completed,
                onChanged: ((_) => task.toggleTask(task.allTasks[index])),
              ),
            );
          }),
    );
  }
}
