import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/auth/sign_up_screen.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import '../common_widgets/custom_text_field.dart';

import '../base/base_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Nome do App
                    Text.rich(TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                              text: 'Green',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: 'grocer',
                              style: TextStyle(
                                  color: CustomColors.customContrastColor))
                        ])),

                    // Categorias
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticineos'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Formulario

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                    ),
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        )),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (c) {
                            return BaseScreen();
                          }));
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Ou',
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (c) {
                            return SignUpScreen();
                          }));
                        },
                        // ignore: prefer_const_constructors
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
