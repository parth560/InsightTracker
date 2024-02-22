import 'package:flutter/material.dart';
import 'package:tracker_app2/collections/workout_isar.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/localization/locale2.dart';
import 'package:tracker_app2/providers/workout_provider.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutRecord record;
  final bool isEnglish;

  const WorkoutCard({required this.record, required this.isEnglish, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale2Data = isEnglish ? Locale2Data.EN : Locale2Data.ES;
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(record.exercise),
        subtitle: Text(
          '${locale2Data['Quantity']}: ${record.quantity}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                final workoutProvider =
                    Provider.of<WorkoutProvider>(context, listen: false);
                await workoutProvider.deleteWorkoutRecord(record);
              },
            ),
            SizedBox(width: 8),
            Text(
              "${record.timestamp.day}/${record.timestamp.month}/${record.timestamp.year}",
            ),
          ],
        ),
        onTap: () {},
        onLongPress: () {},
      ),
    );
  }
}
