import 'package:flutter/material.dart';

import '../../themes/theme_colors.dart';
import '../other/app_fonts.dart';

class ReusableTextFormField extends StatefulWidget {
  const ReusableTextFormField(
      {Key? key,
        this.hintText,
        this.labelText,
        this.inputType,
        this.borderRadius,
        this.mEnableBorderColor,
        this.mFocusColor,
        this.mFocusBorderWidth,
        this.mBorderColor,
        this.isObscure,
        this.suffixIcon,
        this.prefixIcon,
        this.paddingLeft,
        this.paddingRight,
        this.paddingTop,
        this.paddingBottom,
        this.fontWeight,
        this.fontSize,
        this.hintColor,
        this.maxLines,
        this.controller,
        this.onChange,
        this.maxLength,
        this.showCounterText = false,
        this.text,
        this.onTap,
        this.readOnly,
        this.minLines,
        this.focusNode,
        this.filled,
        this.filledColor,
      })
      : super(key: key);


  final TextEditingController? controller;
  final Function(String)? onChange;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final TextInputType? inputType;
  final double? borderRadius;
  final Color? mEnableBorderColor;
  final Color? mFocusColor;
  final Color? mBorderColor;
  final Color? hintColor;
  final double? mFocusBorderWidth;
  final bool? isObscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? showCounterText;
  final String? text;
  final VoidCallback? onTap;
  final bool? readOnly;
  final bool? filled;
  final Color? filledColor;

  @override
  State<ReusableTextFormField> createState() => _ReusableTextFormFieldState();
}

class _ReusableTextFormFieldState extends State<ReusableTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      style:  TextStyle(
          fontFamily: AppFonts.ceraPro,
          fontWeight: widget.fontWeight,
          fontSize : widget.fontSize
      ),


      readOnly: widget.readOnly ?? false,
      keyboardType: widget.inputType ?? TextInputType.name,
      obscureText: widget.isObscure ?? false,
      maxLines: widget.maxLines ?? 1,
      controller: widget.controller,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      onTap: widget.onTap,
      onChanged: widget.onChange,

      decoration: InputDecoration(
          counterText: widget.showCounterText == false ? "" : null,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          /**Hint text and style*/
          hintText: widget.hintText,
          hintStyle:  TextStyle(
              color: widget.hintColor ?? AppColors.grey50,
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize),

          fillColor: widget.filledColor,
          filled: widget.filled,

          /**Label text and style*/
          labelText: widget.labelText,
          contentPadding:  EdgeInsets.fromLTRB(widget.paddingLeft?? 16, widget.paddingTop ??16, widget.paddingRight ??16, widget.paddingBottom??16 ),
          labelStyle: const TextStyle(color: AppColors.deepPurple),
          focusColor: widget.mFocusColor ?? AppColors.deepPurple,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.mFocusColor ?? AppColors.deepPurple,
                width: widget.mFocusBorderWidth ?? 1.0),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.mEnableBorderColor ?? AppColors.grey300),
              borderRadius:
              BorderRadius.circular(widget.borderRadius ?? 10.0)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.mBorderColor ?? AppColors.deepPurple),
              borderRadius:
              BorderRadius.circular(widget.borderRadius ?? 10.0))),
    );
  }
}