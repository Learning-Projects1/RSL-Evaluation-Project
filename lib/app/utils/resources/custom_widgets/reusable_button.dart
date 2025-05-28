import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/theme_colors.dart';
import '../app_fonts.dart';



class ReusableButton extends StatelessWidget {
  const ReusableButton({
    super.key,
    required this.onPressed,
    required this.labelText,
    this.width,
    this.height,
    this.color = AppColors.primaryGreen,
    this.borderRadius,
    this.textColor,
    this.shadowColor,
    this.borderColor,
    this.hasShadow = false,
    this.loading = false,
    this.paddingVertical,
    this.paddingHorizontal,
    this.wrapWidth = false,
  });

  final VoidCallback onPressed;
  final String labelText;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;
  final Color? shadowColor;
  final Color? borderColor;
  final bool? hasShadow;
  final bool? loading;
  final bool? isTransparentBackground = false;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final bool? wrapWidth;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return loading == true
        ? const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoActivityIndicator(
          color: Colors.black,
          radius: 16,
        ),
      ],
    )
        : Padding(
        padding:  const EdgeInsets.symmetric(vertical:12.0),
        child: Container(
          height: height ?? 55,
          width: wrapWidth == true ? null
              : width ?? size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // gradient: const LinearGradient(
              //     colors: [
              //       AppColors.darkPurple,
              //       AppColors.primaryRed,
              //       AppColors.secondaryRed,
              //       //add more colors
              //     ]),
              color: AppColors.lightPurple,
              boxShadow: hasShadow!
                  ? [
                BoxShadow(
                    color: shadowColor ??
                        AppColors.primaryRed.withOpacity(0.6),
                    blurRadius: 10)
              ]
                  : null),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              disabledForegroundColor: Colors.transparent.withOpacity(0.38), disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
              shadowColor: Colors.transparent,
              //make color or elevated button transparent
            ),
            child: Text(
              labelText,
              style: TextStyle(
                  fontFamily: AppFonts.ceraPro,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: textColor),
            ),
          ),
        ));
  }
}