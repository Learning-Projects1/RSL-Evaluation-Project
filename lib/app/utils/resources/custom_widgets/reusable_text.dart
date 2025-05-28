


import 'package:flutter/material.dart';

import '../app_fonts.dart';
import '../app_size_config.dart';

class ReusableText extends StatefulWidget {
  const ReusableText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.mFontFamily,
    this.maxLines,
    this.textAlign, this.textAlignVertical,
    this.fontStyle,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? mFontFamily;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final FontStyle? fontStyle;


  @override
  State<ReusableText> createState() => _ReusableTextState();
}

class _ReusableTextState extends State<ReusableText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          fontSize: widget.fontSize ?? SizeConfig.textSize * 14,
          color: widget.color ?? Colors.black,
          fontWeight: widget.fontWeight ?? FontWeight.w400,
          fontFamily: widget.mFontFamily ?? AppFonts.ceraPro,
          fontStyle: widget.fontStyle),
      maxLines: widget.maxLines??10000,
      overflow: TextOverflow.ellipsis,
      textAlign: widget.textAlign,
    );
  }
}