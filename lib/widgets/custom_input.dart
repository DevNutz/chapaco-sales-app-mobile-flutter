import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType type;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomInput({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    this.type = TextInputType.text,
    this.validator,
    this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      child: TextFormField(
        obscureText: type == TextInputType.visiblePassword,
        validator: validator,
        onSaved: onSaved,
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: Color(0xFF79747E), // Outline color #79747E
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: Color(0xFF79747E), // Outline color #79747E
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: Color(0xFF79747E), // Outline color #79747E
              width: 2.0,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0x80FFFFFF), // Placeholder color #FFFFFF80
          ),
          suffixIcon: Container(
            width: 40.0,
            height: 40.0,
            padding: const EdgeInsets.all(8.0), // Padding to make the icon fit inside the container
            child: Icon(
              icon,
              color: const Color(0xFFFFFFFF), // Icon color to match the text color
            ),
          ),
        ),
        style: const TextStyle(
          fontSize: 16.0,
          height: 24.0 / 16.0, // Line height as a multiplier of the font size
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
