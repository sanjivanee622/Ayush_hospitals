import 'dart:ui';

import 'package:flutter/material.dart';
import 'DropDownType.dart';
import 'dropDownDistrict.dart';
import 'dropDownState.dart';

class TopExpandButtons extends StatefulWidget {
  const TopExpandButtons({Key? key, required this.sortedMarkerSet})
      : super(key: key);
  final ValueChanged<List<String>> sortedMarkerSet;

  @override
  State<TopExpandButtons> createState() => _TopExpandButtonsState();
}

class _TopExpandButtonsState extends State<TopExpandButtons> {
  String? state = 'MAHARASHTRA';
  String? district = 'MUMBAI';
  String? type = 'Public';
  bool isExpanded = false;

  void _search() {
    if (state != null && district != null && type != null) {
      widget.sortedMarkerSet([state!, district!, type!]);
    }
  }

  void _clear() {
    setState(() {
      state = null;
      district = null;
      type = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isExpanded)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.white.withOpacity(0.1),
              height: MediaQuery.of(context).size.height,
            ),
          ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          _search();
                          if (isExpanded) {
                            setState(() {
                              isExpanded = false;
                            });
                          }
                        },
                        icon: Icon(Icons.search_rounded),
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: _clear,
                        icon: Icon(Icons.clear),
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: isExpanded
                            ? Icon(Icons.keyboard_arrow_up)
                            : Icon(Icons.keyboard_arrow_down),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                if (isExpanded)
                  Column(
                    children: [
                      DropDownState(
                        selectedState: (value) {
                          setState(() {
                            state = value;
                            district = null;
                            type = null;
                          });
                        },
                      ),
                      DropDownDistrict(
                        state: state,
                        selectedDistrict: (value) {
                          setState(() {
                            district = value;
                            type = null;
                          });
                        },
                      ),
                      DropDownType(
                        district: district,
                        selectedType: (value) {
                          setState(() {
                            type = value;
                          });
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
