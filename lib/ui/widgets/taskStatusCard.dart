import 'package:flutter/material.dart';

class TaskStatusCard extends StatelessWidget {
  const TaskStatusCard({
    super.key, required this.status, required this.count,
  });
  final String status;
  final String count;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          children: [
            Text(count, style: textTheme.titleLarge,),
            Text(status, style: textTheme.titleSmall,),
          ],
        ),
      ),
    );
  }
}