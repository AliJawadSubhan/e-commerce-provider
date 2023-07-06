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

showSnackBar(String content, context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.blueGrey,
    elevation: 6,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    content: Row(
      children: [
        const Expanded(
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          flex: 3,
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
