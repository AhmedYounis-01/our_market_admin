import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_filed.dart';
import 'package:our_market_admin/core/function/custom_appbar.dart';

class AddAdminScreen extends StatefulWidget {
  const AddAdminScreen({super.key});

  @override
  State<AddAdminScreen> createState() => _AddAdminViewState();
}

class _AddAdminViewState extends State<AddAdminScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Add Admin"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextField(labelText: "Email", controller: _emailController),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: "Password",
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                child: const Text("Add"),
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   cubit.createAnAccount({
                  //     "email": _emailController.text,
                  //     "password": _passwordController.text,
                  //   });
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
