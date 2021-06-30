import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Column(
        children: [
          Divider(
            height: 0,
            thickness: 1,
            color: AppColors.stroke,
          ),
          Row(
            children: [
              Expanded(
                child: LabelButton(
                  label: primaryLabel,
                  style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
                  onPressed: primaryOnPressed,
                ),
              ),
              SizedBox(
                height: 56,
                child: VerticalDivider(
                  thickness: 1,
                  width: 0,
                  color: AppColors.stroke,
                ),
              ),
              Expanded(
                child: LabelButton(
                  label: secondaryLabel,
                  onPressed: secondaryOnPressed,
                  style: enableSecondaryColor ? TextStyles.buttonPrimary : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
