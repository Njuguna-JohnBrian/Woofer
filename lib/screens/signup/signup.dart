import 'package:flutter/material.dart';
import 'package:woofer/button.dart';
import 'package:woofer/theme.dart';

import 'components/create_account.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign up as?",
              style: WFTheme.lightTextTheme.headline2,
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            ReusableButton(
              voidCallbackFunction: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateAccountScreen(),
                  ),
                )
              },
              buttonText: "Pet Owner",
              buttonStyle: TextButton.styleFrom(
                backgroundColor: const Color(
                  0xFFFF9F1C,
                ),
              ),
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ReusableButton(
              voidCallbackFunction: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateAccountScreen(),
                  ),
                )
              },
              buttonText: "Service Provider",
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
            )
          ],
        ),
      ),
    );
  }
}
