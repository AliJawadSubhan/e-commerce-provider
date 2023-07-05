import 'package:flutter/material.dart';

setHorizontalHeight15({double width = 15.0}) {
  return SizedBox(
    width: width,
  );
}

setVerticalHeight15({double height = 15.0}) {
  return SizedBox(
    height: height,
  );
}

buildNumberDropdown(Function(String) onChang, String selectedNumber) {
  return DropdownButtonFormField<String>(
    value: selectedNumber,
    decoration: const InputDecoration(
      labelText: 'Quantity',
    ),
    onChanged: (value) {
      onChang(value!);
    },
    items: <String>['1', '2', '3', '4', '5'].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}
