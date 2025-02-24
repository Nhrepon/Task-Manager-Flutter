import 'package:flutter/material.dart';
import '../../data/model/task_list_by_status_model.dart';
import '../../data/services/apiCaller.dart';
import '../../data/services/apiList.dart';
import '../widgets/ProgressInButton.dart';
import '../widgets/SnackBarMessage.dart';
import '../widgets/TaskItem.dart';
import '../widgets/appNavigationBar.dart';
import '../widgets/background.dart';

class CancelTaskListScreen extends StatefulWidget {
  const CancelTaskListScreen({super.key});

  @override
  State<CancelTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<CancelTaskListScreen> {
  TaskListByStatusModel? taskListByStatusModel;
  bool progress = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewTaskList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavigationBar(),
      body: background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                  visible: progress,
                  replacement: const ProgressInButton(),
                  child: _buildTaskListView()
              )
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
        itemCount: taskListByStatusModel?.taskList?.length ?? 0,
        itemBuilder: (context, index){
          return TaskItem(taskModel: taskListByStatusModel!.taskList![index],);
        }
    );
  }

  Future<void> getNewTaskList()async{
    progress = false;
    setState(() {});
    NetworkResponse response = await ApiCaller.getRequest(url: ApiList.taskListByStatus("Canceled"));
    if(response.isSuccess){
      taskListByStatusModel = TaskListByStatusModel.fromJson(response.responseData!);
    }else{
      ShowSnackBarMessage(context, response.message);
    }
    progress = true;
    setState(() {});
  }




  }

