import 'package:flutter/material.dart';

InputDecoration AppInputDecoration(
    {required String hint, required String label}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    border: const OutlineInputBorder(),
    label: Text(label),
    hintText: hint,
  );
}

ButtonStyle appButtonStyle() {
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(20),
    backgroundColor: Colors.amber.shade800,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

SizedBox SizedBox50(child) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: child,
    ),
  );
}

