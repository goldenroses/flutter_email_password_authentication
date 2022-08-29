import 'package:alpha_app/authentication/service/email_password_auth.dart';
import 'package:alpha_app/authentication/shared/alpha_logo.dart';
import 'package:alpha_app/authentication/shared/email_input.dart';
import 'package:alpha_app/authentication/shared/password_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 60),
                    child: SizedBox(
                      width: 500,
                      child: SingleChildScrollView(
                        primary: true,
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            const AlphaLogo(),
                            Center(
                              child: Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                    left: 22,
                                    bottom: 20,
                                  ),
                                  child: const Center(
                                    child: Text("Login to your account."),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: FractionallySizedBox(
                                    widthFactor: 0.8,
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Center(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                EmailInput(
                                                    emailController:
                                                    emailController),
                                                PasswordInput(
                                                    passwordController:
                                                    passwordController),
                                                const SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child:
                                                      FractionallySizedBox(
                                                        widthFactor: 0.55,
                                                        child: SizedBox(
                                                          height: 36.0,
                                                          child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              await EmailPasswordAuth().loginWithEmailAndPassword(context,
                                                                  emailController
                                                                      .text,
                                                                  passwordController
                                                                      .text);
                                                            },
                                                            child: Text(
                                                              "Login",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: Theme.of(
                                                                    context)
                                                                    .textTheme
                                                                    .titleMedium
                                                                    ?.fontSize,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  // width: double.infinity,
                                                  height: 20,
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context, "/register");
                                                      },
                                                      child: const Text(
                                                        "Register",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration
                                                                .underline,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
