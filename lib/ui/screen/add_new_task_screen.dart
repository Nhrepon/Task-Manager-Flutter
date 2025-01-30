import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/appBar.dart';
import 'package:task_manager/ui/widgets/background.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});
  static String name = 'add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTeController = TextEditingController();
  final TextEditingController _descriptionTeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: app_bar(),
      body: background(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32,),
                Text("Add new task", style: textTheme.titleLarge,),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _titleTeController,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _descriptionTeController,
                  maxLines: 8,
                  decoration: InputDecoration(hintText: "Description"),
                ),
                const SizedBox(height: 16,),
                ElevatedButton(onPressed: (){}, child: const Icon(Icons.arrow_circle_right_outlined))
                    
              ],
            ),
          ),
        ),
      )),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _titleTeController.dispose();
    _descriptionTeController.dispose();
    super.dispose();
  }
}
