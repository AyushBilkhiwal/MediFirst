import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final bool enabled;
  final Color? textColor;
  final borderColor;
  const CustomTextField({super.key, required this.hint,this.textController,this.textColor,this.borderColor=Colors.black,this.enabled=true,});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController? get textController => widget.textController;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: textController,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderColor
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderColor
              )
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderColor
              )
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.textColor)
      ),
    );
  }
}