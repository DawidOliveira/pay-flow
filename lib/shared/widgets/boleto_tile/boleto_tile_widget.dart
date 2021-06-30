import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * .4,
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.minimize),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 78),
                        child: Text.rich(
                          TextSpan(
                            text: "O boleto ",
                            style: TextStyles.buttonHeading.copyWith(
                              fontSize: 26,
                              color: AppColors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: data.name,
                                style: TextStyles.titleRegular.copyWith(
                                  color: AppColors.secondary,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " no valor de R\$ ",
                                style: TextStyles.buttonHeading.copyWith(
                                  fontSize: 26,
                                  color: AppColors.grey,
                                ),
                              ),
                              TextSpan(
                                text: data.value!.toStringAsFixed(2),
                                style: TextStyles.titleRegular.copyWith(
                                  color: AppColors.secondary,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " foi pago?",
                                style: TextStyles.buttonHeading.copyWith(
                                  fontSize: 26,
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Expanded(
                              child: LabelButton(
                                label: "Ainda não",
                                onPressed: () {},
                                enableBorder: true,
                                enableBorderRadius: true,
                                style: TextStyles.buttonGray,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: LabelButton(
                                label: "Sim",
                                enableBorderRadius: true,
                                enableColor: true,
                                style: TextStyles.buttonBackground,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Divider(
                        height: 0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_outline,
                            color: AppColors.delete,
                          ),
                          label: Text(
                            "Deletar boleto",
                            style: TextStyles.buttonBackground
                                .copyWith(color: AppColors.delete),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          "Vence em ${data.dueDate}",
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: "R\$ ",
            style: TextStyles.trailingRegular,
            children: [
              TextSpan(
                text: "${data.value!.toStringAsFixed(2)}",
                style: TextStyles.trailingBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
