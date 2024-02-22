import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/localization/locale1.dart';
import 'package:tracker_app2/providers/diet_provider.dart';
import 'package:tracker_app2/providers/recording_provider.dart';

class DietForm extends StatefulWidget {
  final bool isEnglish;

  const DietForm({Key? key, required this.isEnglish}) : super(key: key);

  @override
  _DietFormState createState() => _DietFormState();
}

class _DietFormState extends State<DietForm> {
  final TextEditingController _foodNameController = TextEditingController();
  final TextEditingController _foodQuantityController = TextEditingController();
  dynamic selectedFood;

  bool _showDropdown = false;
  bool isCupertinoStyle = false;

  @override
  Widget build(BuildContext context) {
    final dietProvider = Provider.of<DietProvider>(context);

    return SizedBox(
      child: isCupertinoStyle
          ? _buildCupertinoStyleForm(dietProvider)
          : _buildMaterialStyleForm(dietProvider),
    );
  }

  Widget _buildMaterialStyleForm(DietProvider dietProvider) {
    return Form(
      child: Column(
        children: [
          if (_showDropdown)
            DropdownButton(
              hint: Text(widget.isEnglish
                  ? Locale1Data.EN['Select Food']
                  : Locale1Data.ES['Select Food']),
              value: selectedFood,
              items: dietProvider.dietRecords.map((record) {
                return DropdownMenuItem(
                  value: record,
                  child: Text(record.food),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedFood = selectedValue;
                });
              },
            ),
          TextFormField(
            decoration: InputDecoration(
              labelText: widget.isEnglish
                  ? Locale1Data.EN['Enter Food Name']
                  : Locale1Data.ES['Enter Food Name'],
            ),
            controller: _foodNameController,
            onChanged: (_) {
              setState(() {
                _showDropdown = false;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: widget.isEnglish
                  ? Locale1Data.EN['Enter Food Quantity']
                  : Locale1Data.ES['Enter Food Quantity'],
            ),
            controller: _foodQuantityController,
          ),
          ElevatedButton(
            child: Text(widget.isEnglish
                ? Locale1Data.EN['Record Diet']
                : Locale1Data.ES['Record Diet']),
            onPressed: () async {
              await _recordDiet(dietProvider);
            },
          ),
          IconButton(
            icon: const Icon(Icons.compare_arrows),
            onPressed: () {
              setState(() {
                isCupertinoStyle = !isCupertinoStyle;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCupertinoStyleForm(DietProvider dietProvider) {
    return Column(
      children: [
        CupertinoTextField(
          placeholder: widget.isEnglish
              ? Locale1Data.EN['Select Food']
              : Locale1Data.ES['Select Food'],
          controller: TextEditingController(text: selectedFood?.food ?? ''),
          readOnly: true,
          onTap: () {
            _showDialog(
              CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (index) {
                  selectedFood = dietProvider.dietRecords[index];
                },
                children: dietProvider.dietRecords.map((record) {
                  return Text(record.food);
                }).toList(),
              ),
            );
          },
        ),
        CupertinoTextField(
          placeholder: widget.isEnglish
              ? Locale1Data.EN['Enter Food Name']
              : Locale1Data.ES['Enter Food Name'],
          controller: _foodNameController,
          keyboardType: isCupertinoStyle ? TextInputType.text : null,
          onChanged: (_) {
            setState(() {
              _showDropdown = false;
            });
          },
        ),
        CupertinoTextField(
          placeholder: widget.isEnglish
              ? Locale1Data.EN['Enter Food Quantity']
              : Locale1Data.ES['Enter Food Quantity'],
          controller: _foodQuantityController,
          keyboardType: isCupertinoStyle ? TextInputType.number : null,
        ),
        CupertinoButton(
          child: Text(widget.isEnglish
              ? Locale1Data.EN['Record Diet']
              : Locale1Data.ES['Record Diet']),
          onPressed: () async {
            await _recordDiet(dietProvider);
          },
        ),
        IconButton(
          icon: isCupertinoStyle
              ? const Icon(CupertinoIcons.arrow_2_squarepath)
              : const Icon(Icons.compare_arrows_rounded),
          onPressed: () {
            setState(() {
              isCupertinoStyle = !isCupertinoStyle;
              _showDropdown = !_showDropdown;
            });
          },
        ),
      ],
    );
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

  Future<void> _recordDiet(DietProvider dietProvider) async {
    await dietProvider.addDietRecord(
      selectedFood != null ? selectedFood.food : _foodNameController.text,
      int.parse(_foodQuantityController.text),
    );
    FocusScope.of(context).unfocus();

    Provider.of<RecordingProvider>(context, listen: false).recordEvent('diet');

    setState(() {
      _showDropdown = true;
      selectedFood = null;
    });

    _foodNameController.clear();
    _foodQuantityController.clear();
  }
}
