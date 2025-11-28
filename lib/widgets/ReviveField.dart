import 'package:flutter/material.dart';
import 'package:revive_app/utils/Theme/Colors.dart';

class Revivefield extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String label;
  final bool obscuretext;
  final FocusNode focusNode;

  const Revivefield({
    super.key,
    required this.controller,
    required this.validator,
    required this.label,
    required this.obscuretext,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        validator: validator,
        obscureText: obscuretext,
        decoration: InputDecoration(
          label: Text(label, style: TextStyle(fontSize: 14)),
          // filled: true,
          fillColor: Colors.black.withOpacity(0.08),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.BgColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.Primarycolor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.LineColor, width: 1),
          ),
        ),
      ),
    );
  }
}
