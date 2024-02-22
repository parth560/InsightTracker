import 'package:flutter/material.dart';
import 'package:tracker_app2/collections/diet_isar.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/localization/locale1.dart';
import 'package:tracker_app2/providers/diet_provider.dart';

class DietCard extends StatelessWidget {
  final DietRecord record;
  final bool isEnglish;

  const DietCard({required this.record, required this.isEnglish, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _quantityController = TextEditingController();

    _quantityController.text = record.quantity.toString();

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(record.food),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isEnglish
                ? Locale1Data.EN['Quantity']
                : Locale1Data.ES['Quantity']),
            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty || int.tryParse(value) == null) {
                } else {
                  record.quantity = int.parse(value);

                  Provider.of<DietProvider>(context, listen: false)
                      .updateDietRecord(record);
                }
              },
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final dietProvider =
                    Provider.of<DietProvider>(context, listen: false);
                await dietProvider.deleteDietRecord(record);
              },
            ),
            const SizedBox(width: 8),
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
