import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_filed.dart';
import 'package:our_market_admin/core/function/custom_appbar.dart';
import 'package:our_market_admin/core/function/navigate_without_back.dart';
import 'package:our_market_admin/core/function/show_msg.dart';
import 'package:our_market_admin/features/add_admin/logic/cubit/add_admin_cubit.dart';
import 'package:our_market_admin/features/auth/ui/login_screen.dart';

class AddAdminScreen extends StatefulWidget {
  const AddAdminScreen({super.key});

  @override
  State<AddAdminScreen> createState() => _AddAdminViewState();
}

class _AddAdminViewState extends State<AddAdminScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordObscured = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAdminCubit(),
      child: BlocConsumer<AddAdminCubit, AddAdminState>(
        listener: (context, state) {
          if (state is AddAdminSuccess) {
            navigateWithoutBack(context, LoginScreen());
          }
          if (state is AddAdminError) {
            showMsg(context, state.errorMsg);
          }
        },
        builder: (context, state) {
          final AddAdminCubit cubit = context.read<AddAdminCubit>();
          return Scaffold(
            appBar: buildCustomAppBar(context, "Add Admin"),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: "Email",
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: "Password",
                      isObscured: isPasswordObscured,
                      controller: _passwordController,
                      onVisibilityToggle: () {
                        setState(() {
                          isPasswordObscured = !isPasswordObscured;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                      child: const Text("Add"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.createAnAccout({
                            "email": _emailController.text,
                            "password": _passwordController.text,
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
