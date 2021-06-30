import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel boletoModel = BoletoModel();
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );
  final dueDateInputTextController = MaskedTextController(
    mask: "00/00/0000",
  );
  final barcodeInputTextController = TextEditingController();
  final boletoNameInputTextController = TextEditingController();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazia" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCode(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;
    boletoModel = boletoModel.copyWith(
      barcode: barcodeInputTextController.text,
      dueDate: dueDateInputTextController.text,
      name: boletoNameInputTextController.text,
      value: moneyInputTextController.numberValue,
    );
    if (form!.validate()) {
      return await saveBoleto();
    }
  }

  Future<void> saveBoleto() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final boletos = instance.getStringList("boletos") ?? <String>[];
      boletos.add(boletoModel.toJson());
      await instance.setStringList("boletos", boletos);
      return;
    } catch (e) {
      throw e;
    }
  }
}
