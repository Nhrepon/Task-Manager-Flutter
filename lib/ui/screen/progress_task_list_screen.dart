import 'package:flutter/material.dart';
import '../widgets/TaskItem.dart';
import '../widgets/appNavigationBar.dart';
import '../widgets/background.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavigationBar(),
      body: background(
        child: _buildTaskListView(),
      ),
    );
  }

  ListView _buildTaskListView() {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index){
          return const TaskItem();
        }
    );
  }
  }

