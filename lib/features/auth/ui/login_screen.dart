import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_filed.dart';
import 'package:our_market_admin/core/function/custom_appbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Login as Admin", isBackButton: false),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              labelText: "Email",
              controller: emailController,
              
              onPressed: () {},
            ),
            SizedBox(height: 20),
            CustomTextField(
              labelText: "Password",
              controller: passwordController,
              obscureText: true,
              onPressed: () {},
            ),
            SizedBox(height: 40),
            CustomElevatedButton(
              width: 120,
              height: 40,
              onPressed: () {},
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
