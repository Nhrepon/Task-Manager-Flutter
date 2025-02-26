import 'package:flutter/material.dart';
import 'package:task_manager/data/services/apiCaller.dart';
import 'package:task_manager/data/services/apiList.dart';
import 'package:task_manager/ui/widgets/ProgressInButton.dart';
import 'package:task_manager/ui/widgets/SnackBarMessage.dart';
import 'package:task_manager/ui/widgets/appNavigationBar.dart';
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
  bool progress = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const AppNavigationBar(),
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
                  decoration: const InputDecoration(hintText: "Title"),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Enter task title here ...";
                    }return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _descriptionTeController,
                  maxLines: 8,
                  decoration: const InputDecoration(hintText: "Description"),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Enter task description here ...";
                    }return null;
                  },
                ),
                const SizedBox(height: 16,),
                Visibility(
                  visible: progress,
                  replacement: const ProgressInButton(),
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      createNewTask();
                    }
                  },
                      child: const Icon(Icons.arrow_circle_right_outlined)),
                )
                    
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> createNewTask()async{
    progress = false;
    setState(() {});
    Map<String, dynamic> reqBody = {
      "title":_titleTeController.text.trim(),
      "description":_descriptionTeController.text.trim(),
      "status": "New"
    };
    final NetworkResponse response = await ApiCaller.postRequest(url: ApiList.createTask, body: reqBody);
    if(response.isSuccess){
      ShowSnackBarMessage(context, response.message);
    }else{
      ShowSnackBarMessage(context, response.message);
    }
    progress = true;
    setState(() {});
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _titleTeController.dispose();
    _descriptionTeController.dispose();
    super.dispose();
  }
}
