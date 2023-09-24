import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woofer/button.dart';

import '../../profile/profile.dart';
import 'input_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _createAccountFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool hasAcceptedTerms = true;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Form(
            key: _createAccountFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "CREATE ACCOUNT",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                InputFieldComponent(
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress,
                  iconData: Icons.email,
                  labelText: "Email",
                  hintText: "hello@woofer.com",
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                InputFieldComponent(
                  textEditingController: _usernameController,
                  textInputType: TextInputType.text,
                  iconData: Icons.person,
                  labelText: "Username",
                  hintText: "wooferUser",
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                InputFieldComponent(
                  textEditingController: _passwordController,
                  textInputType: TextInputType.visiblePassword,
                  iconData: Icons.password,
                  labelText: "Password",
                  hintText: "password",
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: hasAcceptedTerms,
                      onChanged: (termsAccepted) => {
                        setState(() {
                          hasAcceptedTerms = termsAccepted!;
                        })
                      },
                      activeColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          2.0,
                        ),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                      ),
                      checkColor: Colors.black,
                      fillColor: MaterialStateProperty.resolveWith(
                        (Set states) {
                          if (states.contains(MaterialState.error)) {
                            return Colors.white;
                          }
                          return Colors.transparent;
                        },
                      ),
                    ),
                    const Text(
                      "By creating an account, you agree to our \n terms and conditions",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                ReusableButton(
                  voidCallbackFunction: () => {
                    if (_createAccountFormKey.currentState!.validate())
                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        )
                      }
                  },
                  buttonText: "SIGN UP",
                  buttonStyle: TextButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF643B09,
                    ),
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
