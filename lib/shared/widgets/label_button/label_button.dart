import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.style,
    this.enableColor = false,
    this.enableBorder = false,
    this.enableBorderRadius = false,
  }) : super(key: key);
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  final bool enableColor;
  final bool enableBorder;
  final bool enableBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: enableColor ? AppColors.primary : null,
        border: enableBorder
            ? Border.all(
                color: AppColors.stroke,
              )
            : null,
        borderRadius: enableBorderRadius ? BorderRadius.circular(5) : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: style ?? TextStyles.buttonHeading,
        ),
      ),
    );
  }
}
