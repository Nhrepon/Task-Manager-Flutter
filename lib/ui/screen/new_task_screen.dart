import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/background.dart';
import '../widgets/TaskItem.dart';
import '../widgets/appNavigationBar.dart';
import '../widgets/taskStatusCard.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppNavigationBar(),
      body: background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTaskStatusBar(),
              _buildTaskListView(),
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildTaskListView() {
    return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 10,
                itemBuilder: (context, index){
                return const TaskItem();
                }
            );
  }

  Widget _buildTaskStatusBar() {
    return const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TaskStatusCard(status: "New", count: "12",),
                  TaskStatusCard(status: "Pending", count: "06",),
                  TaskStatusCard(status: "Completed", count: "19",),
                  TaskStatusCard(status: "Canceled", count: "09",),
                ],
              ),
            ),
          );
  }
}






