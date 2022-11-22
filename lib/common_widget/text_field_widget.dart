import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/utils/tools.dart';



class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String labeltxt;
  final bool isValid;
  final String validationMessage;
  final TextInputType textInputType;
  final String hinttext;
  final bool obscureText;
  final int maxLines;
  final int maxLenght;
  final double size;
  final TextAlign textAlign;
  final List<TextInputFormatter> inputFormatter;
  final TextCapitalization capitalization;
  final String Function(dynamic) validator;
  final bool suffixIcon;
  final Widget suffixIconWidget;
  final Color borderColor;
  final bool isDisabled;
  final Widget preffixIconWidget;
  final TextStyle style;
  final bool autoFucus;
  final Function onChange;

  const TextFieldWidget(
      {Key key,
      this.isPassword,
      this.controller,
      this.labeltxt,
      this.isValid,
      this.validationMessage,
      this.textInputType,
      this.hinttext,
      this.obscureText,
      this.maxLines,
      this.maxLenght,
      this.size,
      this.textAlign,
      this.inputFormatter,
      this.capitalization,
      this.validator,
      this.suffixIcon,
      this.suffixIconWidget,
      this.borderColor,
      this.isDisabled,
      this.preffixIconWidget,
      this.style,
      this.autoFucus,
      this.onChange})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isObscured = false;
  Tools tools = Tools();

  @override
  void initState() {
    isObscured = widget.obscureText ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFucus ?? false,
      controller: widget.controller,
      keyboardType: widget.textInputType ?? TextInputType.text,
      textAlign: widget.textAlign ?? TextAlign.left,
      inputFormatters: widget.inputFormatter,
      enabled: widget.isDisabled ?? true,
      textCapitalization: widget.capitalization ?? TextCapitalization.words,
      style: widget.style,
      onChanged: (String val) {
        if (widget.onChange != null) {
          widget.onChange(val);
        }
      },
      decoration: InputDecoration(

          // hintStyle: TextStyle(
          //   fontSize: widget.size,
          // ),
          hintText: widget.hinttext,
          labelText: widget.labeltxt,
          counterText: "",
          labelStyle:
              const TextStyle(color: grey_color, fontSize:13),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: widget.borderColor ?? grey_color.withOpacity(0.3),
                  width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: widget.borderColor ?? grey_color.withOpacity(0.3),
                  width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: widget.borderColor ?? grey_color.withOpacity(0.3),
                  width: 1)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: widget.borderColor ?? grey_color.withOpacity(0.3),
                  width: 1)),
          suffixIconConstraints:
              widget.obscureText != null && !widget.obscureText
                  ? null
                  : const BoxConstraints(
                      minWidth: 40, maxWidth: 41, maxHeight: 21, minHeight: 20),
          suffixIcon: widget.obscureText == null
              ? widget.suffixIcon == null
                  ? null
                  : widget.suffixIconWidget
              : Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      child: Icon(
                        isObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: grey_color,
                      )),
                ),
          prefixIcon: widget.preffixIconWidget ?? null),

      obscureText: isObscured,
      maxLength: widget.maxLenght,
      validator: (String value) => widget.validator(value),

      // maxLines:obscureText??obscureText?1: maxLines,
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
