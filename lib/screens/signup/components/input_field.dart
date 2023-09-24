import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFieldComponent extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final IconData iconData;
  final String labelText;
  final String hintText;
  final bool showIcon;

  const InputFieldComponent({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    required this.iconData,
    required this.labelText,
    required this.hintText,
    this.showIcon = true,
  });

  @override
  State<InputFieldComponent> createState() => _InputFieldComponentState();
}

class _InputFieldComponentState extends State<InputFieldComponent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.10,
        right: size.width * 0.10,
      ),
      child: TextFormField(
        controller: widget.textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: ((value) {
          if (value!.isEmpty) {
            return '${widget.labelText} is required';
          }
          return null;
        }),
        cursorColor: Colors.grey,
        style: TextStyle(
          color: Colors.black.withOpacity(
            0.5,
          ),
        ),
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          prefixIcon: widget.showIcon
              ? Icon(
                  widget.iconData,
                  color: Colors.black,
                )
              : null,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hintText,
          labelStyle: GoogleFonts.openSans().copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
