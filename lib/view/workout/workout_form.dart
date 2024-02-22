import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/localization/locale2.dart';
import 'package:tracker_app2/localization/locale3.dart';
import 'package:tracker_app2/providers/recording_provider.dart';
import 'package:tracker_app2/providers/workout_provider.dart';

const double _kItemExtent = 32.0;

class WorkoutForm extends StatefulWidget {
  final bool isEnglish;

  const WorkoutForm({Key? key, required this.isEnglish}) : super(key: key);

  @override
  _WorkoutFormState createState() => _WorkoutFormState();
}

class _WorkoutFormState extends State<WorkoutForm> {
  final TextEditingController _quantityController = TextEditingController();
  bool isCupertinoStyle = false;

  String? _selectedExercise;
  List<String> _exerciseList() {
    Set<String> uniqueExercises = Set.from(widget.isEnglish
        ? Locale3Data.exerciseListEN
        : Locale3Data.exerciseListES);
    return uniqueExercises.toList();
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    if (isCupertinoStyle) {
      return CupertinoTextField(
        placeholder: widget.isEnglish
            ? Locale2Data.EN['Enter Calories']
            : Locale2Data.ES['Enter Calories'],
        controller: _quantityController,
        keyboardType: TextInputType.number,
      );
    } else {
      return TextFormField(
        decoration: InputDecoration(
          labelText: widget.isEnglish
              ? Locale2Data.EN['Enter Calories']
              : Locale2Data.ES['Enter Calories'],
        ),
        controller: _quantityController,
        keyboardType: TextInputType.number,
      );
    }
  }

  Widget _buildDropdown(BuildContext context) {
    if (isCupertinoStyle) {
      return CupertinoButton(
        onPressed: () {
          _showDialog(
            CupertinoPicker(
              itemExtent: _kItemExtent,
              scrollController: FixedExtentScrollController(
                initialItem: _selectedExercise != null
                    ? _exerciseList().indexOf(_selectedExercise!)
                    : 0,
              ),
              onSelectedItemChanged: (selectedIndex) {
                setState(() {
                  _selectedExercise = _exerciseList()[selectedIndex];
                });
              },
              children: _exerciseList().map((exercise) {
                return Center(child: Text(exercise));
              }).toList(),
            ),
          );
        },
        child: Text(
          _selectedExercise != null
              ? _selectedExercise!
              : widget.isEnglish
                  ? Locale2Data.EN['Select Exercise']
                  : Locale2Data.ES['Select Exercise'],
          style: const TextStyle(fontSize: 22.0),
        ),
      );
    } else {
      return DropdownButtonFormField<String>(
        value: _selectedExercise,
        hint: Text(
          widget.isEnglish
              ? Locale2Data.EN['Select Exercise']
              : Locale2Data.ES['Select Exercise'],
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedExercise = newValue;
          });
        },
        items: _exerciseList().map((exercise) {
          return DropdownMenuItem<String>(
            value: exercise,
            child: Text(exercise),
          );
        }).toList(),
      );
    }
  }

  Widget _buildButton(BuildContext context) {
    if (isCupertinoStyle) {
      return CupertinoButton(
        child: Text(widget.isEnglish
            ? Locale2Data.EN['Record Workout']
            : Locale2Data.ES['Record Workout']),
        onPressed: () async {
          final workoutProvider =
              Provider.of<WorkoutProvider>(context, listen: false);
          if (_selectedExercise != null) {
            await workoutProvider.addWorkoutRecord(
              _selectedExercise!,
              int.parse(_quantityController.text),
            );
            FocusScope.of(context).unfocus();
            Provider.of<RecordingProvider>(context, listen: false)
                .recordEvent('workout');
          }
          _quantityController.clear();
          setState(() {
            _selectedExercise = null;
          });
        },
      );
    } else {
      return ElevatedButton(
        child: Text(widget.isEnglish
            ? Locale2Data.EN['Record Workout']
            : Locale2Data.ES['Record Workout']),
        onPressed: () async {
          final workoutProvider =
              Provider.of<WorkoutProvider>(context, listen: false);
          if (_selectedExercise != null) {
            await workoutProvider.addWorkoutRecord(
              _selectedExercise!,
              int.parse(_quantityController.text),
            );
            FocusScope.of(context).unfocus();
            Provider.of<RecordingProvider>(context, listen: false)
                .recordEvent('workout');
          }
          _quantityController.clear();
          setState(() {
            _selectedExercise = null;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        child: Column(
          children: [
            _buildDropdown(context),
            _buildTextField(context),
            _buildButton(context),
            IconButton(
              icon: isCupertinoStyle
                  ? const Icon(CupertinoIcons.arrow_2_squarepath)
                  : const Icon(Icons.compare_arrows_rounded),
              onPressed: () {
                setState(() {
                  isCupertinoStyle = !isCupertinoStyle;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
