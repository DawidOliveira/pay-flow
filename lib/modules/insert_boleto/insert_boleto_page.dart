import 'package:flutter/material.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  @override
  void initState() {
    if (widget.barcode != null) {
      controller.barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.input,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 93,
              ),
              child: Text(
                "Preencha os dados do boleto",
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 39,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      textCapitalization: TextCapitalization.sentences,
                      textEditingController:
                          controller.boletoNameInputTextController,
                      icon: Icons.description_outlined,
                      label: 'Nome do boleto',
                      validator: controller.validateName,
                    ),
                    InputTextWidget(
                      textEditingController:
                          controller.dueDateInputTextController,
                      icon: FontAwesomeIcons.timesCircle,
                      label: 'Vencimento',
                      textInputType: TextInputType.datetime,
                      validator: controller.validateVencimento,
                    ),
                    InputTextWidget(
                      textEditingController:
                          controller.moneyInputTextController,
                      icon: FontAwesomeIcons.wallet,
                      label: 'Valor R\$',
                      textInputType: TextInputType.number,
                      validator: (_) => controller.validateValor(
                          controller.moneyInputTextController.numberValue),
                    ),
                    InputTextWidget(
                      textEditingController:
                          controller.barcodeInputTextController,
                      icon: FontAwesomeIcons.barcode,
                      textInputType: TextInputType.number,
                      label: 'Código',
                      validator: controller.validateCode,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Navigator.of(context).pop();
        },
        secondaryLabel: "Cadastrar",
        enableSecondaryColor: true,
        secondaryOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
      ),
    );
  }
}
