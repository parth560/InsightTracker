import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/providers/recording_provider.dart';
import 'package:tracker_app2/localization/locale3.dart';

class BottomSheetWidget extends StatelessWidget {
  final bool isEnglish;

  const BottomSheetWidget({Key? key, required this.isEnglish})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Consumer<RecordingProvider>(
              builder: (context, provider, child) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isEnglish
                                ? Locale3Data.EN['lastRecorded']
                                : Locale3Data.ES['lastRecorded'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${isEnglish ? Locale3Data.EN['lastRecorded'] : Locale3Data.ES['lastRecorded']}: ${provider.lastRecordTime}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${isEnglish ? Locale3Data.EN['lastRecordingType'] : Locale3Data.ES['lastRecordingType']}: ${provider.lastRecordType}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${isEnglish ? Locale3Data.EN['recordingPoints'] : Locale3Data.ES['recordingPoints']}: ${provider.recordingPoints}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${isEnglish ? Locale3Data.EN['dedicationLevel'] : Locale3Data.ES['dedicationLevel']}: ${provider.calculateDedicationLevel()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${isEnglish ? Locale3Data.EN['rpNeededForNextLevel'] : Locale3Data.ES['rpNeededForNextLevel']}: ${provider.calculateRPForNextLevel()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${isEnglish ? Locale3Data.EN['rpForRecordingNow'] : Locale3Data.ES['rpForRecordingNow']}: ${provider.calculateRPForRecordingNow()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: Card(
        color: const Color.fromARGB(255, 36, 134, 231),
        elevation: 5,
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isEnglish
                        ? Locale3Data.EN['recordingInformation']
                        : Locale3Data.ES['recordingInformation'],
                    style: const TextStyle(
                      color: Color.fromARGB(255, 14, 13, 13),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                isEnglish
                    ? Locale3Data.EN['tapToView']
                    : Locale3Data.ES['tapToView'],
                style: const TextStyle(
                  color: Color.fromARGB(255, 20, 20, 20),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
