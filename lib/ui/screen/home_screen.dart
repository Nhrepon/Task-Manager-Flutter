import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/new_task_screen.dart';
import 'package:task_manager/ui/screen/progress_task_list_screen.dart';

import 'add_new_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    ProgressTaskListScreen(),
    NewTaskScreen(),
    NewTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectIndex],
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pushNamed(context, AddNewTaskScreen.name);},child: const Icon(Icons.add),),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectIndex,
          onDestinationSelected: (int index){
          _selectIndex = index;
          setState(() {});
          },
          destinations: const [
        NavigationDestination(icon: Icon(Icons.new_label_outlined), label: "New"),
        NavigationDestination(icon: Icon(Icons.refresh), label: "Progress"),
        NavigationDestination(icon: Icon(Icons.done), label: "Completed"),
        NavigationDestination(icon: Icon(Icons.cancel_outlined), label: "Cancel"),
      ]),
    );
  }
}
