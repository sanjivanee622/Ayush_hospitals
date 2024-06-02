import 'package:flutter/material.dart';

class DropDownType extends StatefulWidget {
  final String? district;
  final ValueChanged<String?> selectedType;

  const DropDownType({Key? key, required this.district, required this.selectedType}) : super(key: key);

  @override
  _DropDownTypeState createState() => _DropDownTypeState();
}

class _DropDownTypeState extends State<DropDownType> {
  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedType,
      style: TextStyle(color: Colors.white), // Set text color to white
      dropdownColor: Colors.transparent,
      items: <String>["Public"] // Add more types as needed
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,            style: TextStyle(color: Colors.white), // Set text color to white
),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedType = newValue;
          widget.selectedType(newValue);
        });
      },
    );
  }
}
