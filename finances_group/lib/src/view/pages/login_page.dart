// ignore_for_file: use_build_context_synchronously

import 'package:finances_group/src/controller/login_controller.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/states/login_state.dart';
import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/widgets/login-register/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final loginUser = LoginController();

  final loginKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _setStatusbarColor();
  }

  _setStatusbarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppCustomColors.dark);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      icon: Icons.mail_outline,
                      label: 'E-mail',
                      typeKeyboard: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      icon: Icons.key_outlined,
                      label: 'Senha',
                      isSecret: true,
                      typeKeyboard: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    ElevatedButton(
                      onPressed: <Object>() async {
                        final result = await loginUser.logar(
                          LoginModel(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                        if (result is LoginStateLoading) {
                          const CircularProgressIndicator();
                        }
                        if (result is LoginStateSucces) {
                          return Navigator.of(context)
                              .pushNamed('/home', arguments: result.userLogged);
                        }
                        if (result is LoginStateError) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Ops, algo deu errado'),
                                  icon: const Icon(Icons.error),
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  content: SizedBox(
                                    height: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text('Credenciais Inválidas!'),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                      child: const Text(
                        'Entrar',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: const Text(
                        'Não tem login? Cadastre-se',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
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
