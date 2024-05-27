import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  final String hintText;
  final String labelText;
  final  TextEditingController controller;
  final TextInputType textInputType;
  final bool obscure;
  final bool enabled;
  final validate;
  const FormFields({
    super.key, required this.hintText, required this.labelText, required this.controller, required this.textInputType, required this.obscure, required this.enabled, this.validate,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        obscureText: obscure,
        enabled: enabled,
        validator: validate,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white30,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(6)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.green,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(6)
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 14, color: Colors.white54),
          hintStyle: const TextStyle(fontSize: 13, color: Colors.white54),
          //errorText: 'Error'
          errorStyle: TextStyle(color: Colors.orange[900])
          //labelText: 'label'
        ),
      ),
    );
  }
}
