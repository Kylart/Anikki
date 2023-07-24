import 'package:flutter/material.dart';

class SettingsTextField extends StatefulWidget {
  const SettingsTextField({
    super.key,
    required this.onChanged,
    this.obscureText = false,
    this.isNumber = false,
    this.initialValue,
  });

  final void Function(String value) onChanged;
  final bool obscureText;
  final bool isNumber;
  final String? initialValue;

  @override
  State<SettingsTextField> createState() => _SettingsTextFieldState();
}

class _SettingsTextFieldState extends State<SettingsTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
    controller.addListener(() {
      widget.onChanged(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        keyboardType: widget.isNumber ? TextInputType.number : null,
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12.0),
        obscureText: widget.obscureText,
        decoration: const InputDecoration(
          filled: false,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
        ),
      ),
    );
  }
}
