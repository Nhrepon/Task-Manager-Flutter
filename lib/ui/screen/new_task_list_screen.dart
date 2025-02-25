import 'package:flutter/material.dart';
import 'package:task_manager/data/model/task_count_by_status_model.dart';
import 'package:task_manager/data/model/task_count_model.dart';
import 'package:task_manager/data/services/apiCaller.dart';
import 'package:task_manager/data/services/apiList.dart';
import 'package:task_manager/ui/widgets/ProgressInButton.dart';
import 'package:task_manager/ui/widgets/SnackBarMessage.dart';
import 'package:task_manager/ui/widgets/background.dart';
import '../../data/model/task_list_by_status_model.dart';
import '../widgets/TaskItem.dart';
import '../widgets/appNavigationBar.dart';
import '../widgets/taskStatusCard.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool progress = true;
  TaskCountByStatusModel? taskCountByStatusModel;
  TaskListByStatusModel? taskListByStatusModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTaskCountByStatus();
    getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const AppNavigationBar(),
      body: background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTaskStatusBar(),
              Visibility(
                visible: progress,
                  replacement: const ProgressInButton(),
                  child: _buildTaskListView()
              ),
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
                return TaskItem(
                  taskModel: taskListByStatusModel!.taskList![index],
                );
                }
            );
  }

  Widget _buildTaskStatusBar() {
    return Visibility(
      visible: progress,
      replacement: const ProgressInButton(),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: taskCountByStatusModel?.taskByStatusList?.length ?? 0,
              itemBuilder: (context, index){
              final TaskCountModel model = taskCountByStatusModel!.taskByStatusList![index];
                return TaskStatusCard(
                  status: model.sId ?? '',
                  count: model.sum.toString(),
                );
              }
          ),
        )
      ),
    );
  }

  Future<void> getTaskCountByStatus()async{
    progress = false;
    setState(() {});
    NetworkResponse response = await ApiCaller.getRequest(url: ApiList.taskStatusCount);
    if(response.isSuccess){
      taskCountByStatusModel = TaskCountByStatusModel.fromJson(response.responseData!);
    }else{
      ShowSnackBarMessage(context, response.message);
    }
    progress = true;
    setState(() {});
  }

  Future<void> getNewTaskList()async{
    progress = false;
    setState(() {});
    NetworkResponse response = await ApiCaller.getRequest(url: ApiList.taskListByStatus("New"));
    if(response.isSuccess){
      taskListByStatusModel = TaskListByStatusModel.fromJson(response.responseData!);
    }else{
      ShowSnackBarMessage(context, response.message);
    }
    progress = true;
    setState(() {});
  }




}






