import 'package:flutter/material.dart';
import 'package:task_manager/data/model/task_model.dart';

import '../utility/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key, required this.taskModel,
  });

  final TaskModel taskModel;



  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        tileColor: Colors.white,
        title: Text(taskModel.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.description ?? ''),
            Text(taskModel.createdDate ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: getStatusColor(taskModel.status ?? "New"),

                  ),
                  child: Text(taskModel.status ?? "New", style: TextStyle(color: Colors.white),),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Color getStatusColor(String status){
    if(status == "New"){
      return Colors.green;
    }else if(status == "Completed"){
      return Colors.blue;
    }else if(status == "Progress"){
      return Colors.purple;
    }else{
      return Colors.red;
    }
  }
}