import 'package:flutter/material.dart';

class DropDownState extends StatefulWidget {
  final ValueChanged<String?> selectedState;

  const DropDownState({Key? key, required this.selectedState}) : super(key: key);

  @override
  _DropDownStateState createState() => _DropDownStateState();
}

class _DropDownStateState extends State<DropDownState> {
  String? _selectedState;

  List<String> states = [
    "ANDAMAN AND NICOBAR ISLANDS",
    "ANDHRA PRADESH",
    "ARUNACHAL PRADESH",
    "ASSAM",
    "BIHAR",
    "CHANDIGARH",
    "CHHATTISGARH",
    "DADRA AND NAGAR HAVELI",
    "DAMAN AND DIU",
    "GOA",
    "GUJARAT",
    "HARYANA",
    "HIMACHAL PRADESH",
    "JAMMU AND KASHMIR",
    "JHARKHAND",
    "KARNATAKA",
    "KERALA",
    "LADAKH",
    "LAKSHADWEEP",
    "MADHYA PRADESH",
    "MAHARASHTRA",
    "MANIPUR",
    "MEGHALAYA",
    "MIZORAM",
    "NAGALAND",
    "NCT OF DELHI",
    "ODISHA",
    "PSU",
    "PUDUCHERRY",
    "PUNJAB",
    "RAJASTHAN",
    "SIKKIM",
    "TAMIL NADU",
    "TELANGANA",
    "TRIPURA",
    "UTTARAKHAND",
    "UTTAR PRADESH",
    "WEST BENGAL"
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedState,
      style: TextStyle(color: Colors.white), // Set text color to white
      dropdownColor: Colors.transparent, // Set dropdown background color to transparent
      items: states.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedState = newValue;
          widget.selectedState(newValue);
        });
      },
    );
  }
}
