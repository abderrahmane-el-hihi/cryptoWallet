import 'package:reBlock/Components/MainButton.dart';
import 'package:reBlock/Components/SvgButton.dart';
import 'package:reBlock/Components/TextInput.dart';

import 'package:reBlock/Services/Service.dart';
import 'package:reBlock/main.dart';
import 'package:reBlock/pages/SwitchPages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final emailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

bool biometricsAvilable = false;

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              TextInput(
                controller: emailcontroller,
                obscureText: false,
                title: "email",
                suffIcon: Icons.email_rounded,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              TextInput(
                controller: passwordcontroller,
                obscureText: false,
                title: "password",
                suffIcon2: Icons.visibility_rounded,
                suffIcon: Icons.visibility_off_rounded,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, top: 12, bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                          onPressed: () async {
                            if (emailcontroller.text.isNotEmpty &&
                                passwordcontroller.text.isNotEmpty) {
                              String userID = await Service()
                                  .signInEmailAndPassword(emailcontroller.text,
                                      passwordcontroller.text);
                              supabase.auth.signInWithPassword(
                                email: emailcontroller.text,
                                password: passwordcontroller.text,
                              );
                              if (userID != '') {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SwitchPages()));
                              } else {
                                const AlertDialog(
                                  title: Text('Check Email or Password'),
                                );
                              }
                            } else {
                              const AlertDialog(
                                title: Text('Fill the Email and Password'),
                              );
                            }

                            emailcontroller.clear();
                            passwordcontroller.clear();
                          },
                          hasIcon: false,
                          icondata: Icons.abc,
                          title: 'Sign In'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          )),
                      padding: const EdgeInsets.all(6),
                      child: IconButton(
                          onPressed: () async {
                            final LocalAuthentication localauth =
                                LocalAuthentication();
                            bool isBiometricsAvailable =
                                await localauth.canCheckBiometrics;
                            bool isAuthentificated = false;
                            if (isBiometricsAvailable) {
                              biometricsAvilable = true;
                            } else {
                              biometricsAvilable;
                            }
                            if (biometricsAvilable) {
                              isAuthentificated = await localauth.authenticate(
                                localizedReason:
                                    'authenticate using biometrics',
                                options: const AuthenticationOptions(
                                    stickyAuth: true, useErrorDialogs: true),
                              );
                            }
                            if (isAuthentificated) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SwitchPages()));
                            }
                          },
                          icon: Icon(
                            Icons.fingerprint_rounded,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .04,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .04,
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              SvgButton(
                  imgsrc: 'assets/google.svg',
                  onPressed: () {},
                  title: 'Sign In with Google'),
              SvgButton(
                  imgsrc: 'assets/facebook.svg',
                  onPressed: () {},
                  title: 'Sign In with Facebook'),
            ],
          ),
        ),
      ),
    );
  }
}
