import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * .36,
              color: AppColors.primary,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 70,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 50,
                              spreadRadius: -80,
                            )
                          ],
                        ),
                        child: Image.asset(
                          AppImages.person,
                          width: 208,
                          height: size.height * .45,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 50,
                                spreadRadius: -130,
                                offset: Offset(0, 60),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logomini),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Text(
                          'Organize seus boletos em um só lugar',
                          style: TextStyles.titleHome,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SocialLoginButton(
                          onTap: () async {
                            await controller.googleSignIn(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
