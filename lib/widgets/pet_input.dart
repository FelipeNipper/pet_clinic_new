import 'package:flutter/material.dart';

class PetInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const PetInput({required this.controller, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
