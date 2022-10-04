import 'package:flutter/material.dart';

class PetInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const PetInput({required this.controller, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
