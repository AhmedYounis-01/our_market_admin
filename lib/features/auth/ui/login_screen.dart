import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/components/custom_circular_ind.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_filed.dart';
import 'package:our_market_admin/core/function/custom_appbar.dart';
import 'package:our_market_admin/core/function/navigate_without_back.dart';
import 'package:our_market_admin/core/function/show_msg.dart';
import 'package:our_market_admin/features/auth/logic/cubit/login_cubit.dart';
import 'package:our_market_admin/features/home/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordObscured = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            const CustomCircularIndicator();
          }
          if (state is LoginSuccess) {
            navigateWithoutBack(context, const HomeScreen());
          }
          if (state is LoginError) {
            showMsg(context, state.errorMsg);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = context.read<LoginCubit>();
          return Scaffold(
            appBar: buildCustomAppBar(
              context,
              "Login as Admin",
              isBackButton: false,
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: state is LoginLoading
                  ? const CustomCircularIndicator()
                  : Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            labelText: "Email",
                            controller: emailController,
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            labelText: "Password",
                            controller: passwordController,
                            isObscured: isPasswordObscured,
                            onVisibilityToggle: () {
                              setState(() {
                                isPasswordObscured = !isPasswordObscured;
                              });
                            },
                          ),
                          SizedBox(height: 40),
                          CustomElevatedButton(
                            width: 120,
                            height: 40,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.login({
                                  "email": emailController.text,
                                  "password": passwordController.text,
                                });
                              }
                            },
                            child: Text("Login"),
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
