import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoInfoWidget extends StatefulWidget {
  final int size;
  const BoletoInfoWidget({Key? key, required this.size}) : super(key: key);

  @override
  _BoletoInfoWidgetState createState() => _BoletoInfoWidgetState();
}

class _BoletoInfoWidgetState extends State<BoletoInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
            SizedBox(
              height: 32,
              child: VerticalDivider(
                thickness: 1,
                width: 0,
                color: AppColors.background,
              ),
            ),
            Text.rich(
              TextSpan(
                  text: "Você tem ",
                  style: TextStyles.captionBackground,
                  children: [
                    TextSpan(
                      text:
                          "${widget.size} boleto${widget.size > 1 ? 's' : ''}\n",
                      style: TextStyles.captionBoldBackground,
                    ),
                    TextSpan(
                      text:
                          "cadastrado${widget.size > 1 ? 's' : ''} para pagar",
                      style: TextStyles.captionBackground,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
