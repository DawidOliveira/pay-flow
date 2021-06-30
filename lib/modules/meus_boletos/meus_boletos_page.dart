import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  final BoletoListController controller;
  const MeusBoletosPage({Key? key, required this.controller}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              "Meus boletos",
              style: TextStyles.titleBoldHeading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Divider(
              color: AppColors.stroke,
              height: 0,
              thickness: 1,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: widget.controller.boletosNotifier,
            builder: (_, __, ___) => BoletoListWidget(
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }
}
