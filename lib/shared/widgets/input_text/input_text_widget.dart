import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final TextEditingController textEditingController;

  const InputTextWidget({
    Key? key,
    this.initialValue,
    required this.label,
    required this.icon,
    this.validator,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            textCapitalization: textCapitalization,
            validator: validator,
            initialValue: initialValue,
            style: TextStyles.input,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyles.input,
              contentPadding: EdgeInsets.zero,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Icon(
                      icon,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(
                    height: 48,
                    child: VerticalDivider(
                      thickness: 1,
                      color: AppColors.stroke,
                    ),
                  ),
                ],
              ),
              border: InputBorder.none,
            ),
          ),
          Divider(
            color: AppColors.stroke,
            height: 1,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
