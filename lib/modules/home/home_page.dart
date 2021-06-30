import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:animated_card/animated_card.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({Key? key, required this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final boletoListController = BoletoListController();
  HomeController? controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: controller!.currentPage == 0 ? 184 : 152,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.shape,
                    AppColors.primary,
                  ],
                  center: Alignment(0, 3.4),
                  radius: 2,
                ),
              ),
              child: Center(
                child: ListTile(
                  title: Text.rich(
                    TextSpan(
                      text: "Olá, ",
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                          text: "${widget.user.name}",
                          style: TextStyles.titleBoldBackground,
                        )
                      ],
                    ),
                  ),
                  subtitle: Text(
                    "Mantenha suas contas em dia",
                    style: TextStyles.captionShape,
                  ),
                  trailing: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.user.photoURL,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: controller!.currentPage == 0,
              child: Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: -40,
                child: AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ValueListenableBuilder<List<BoletoModel>>(
                      valueListenable: boletoListController.boletosNotifier,
                      builder: (_, __, ___) => BoletoInfoWidget(
                        size: boletoListController.boletos.length,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        preferredSize:
            Size.fromHeight(controller!.currentPage == 0 ? 184 : 152),
      ),
      body: controller!.currentPage == 0
          ? Padding(
              padding: const EdgeInsets.only(top: 35),
              child: MeusBoletosPage(
                controller: boletoListController,
              ),
            )
          : ExtractPage(
              controller: boletoListController,
            ),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller!.setPage(0);
                setState(() {});
              },
              icon: Icon(
                Icons.home,
                color: controller!.currentPage == 0
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/barcode_scanner');
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller!.setPage(1);
                setState(() {});
              },
              icon: Icon(
                Icons.description_outlined,
                color: controller!.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
