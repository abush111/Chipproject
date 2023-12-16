import 'package:chipapp/bloc/loginbloc/LoginCubit.dart';
import 'package:chipapp/helper/textInputwidget.dart';
import 'package:chipapp/helper/validation.dart';
import 'package:chipapp/page/Bottomnav.dart';
import 'package:chipapp/page/Home.dart';
import 'package:chipapp/themes/theme_button.dart';
import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // Navigate to the next screen or perform any action on successful login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNav()),
          );
        } else if (state is LoginFailure) {
          // Show an error message or perform any action on login failure
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return Center(
            child: Container(
                margin: EdgeInsets.only(top: height * 0.4),
                child: CircularProgressIndicator()),
          );
        } else {
          return Stack(
            children: [
              Image.asset(
                "assets/images/placeholder.png",
                height: 439,
                width: width,
                fit: BoxFit.cover,
              ),
              Container(
                width: width,
                height: 375.0,
                margin: EdgeInsets.only(top: 407.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white, // Replace with your desired color
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                top: 25,
                                left: 28.0,
                                right: 45,
                              ),
                              child: Text(
                                "Sign In",
                                textAlign: TextAlign.left,
                                style: ThemeText.Text1,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomTextInput(
                        hinttext: "Enter phone",
                        controller: phoneController,
                        validator: (value) =>
                            value.toString().validatePhoneNumber,
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomTextInput(
                        obscureText: isHiddenPassword,
                        validator: (value) => value.toString().validatePassword,
                        hinttext: "Enter password",
                        controller: passwordController,
                        prefixicon: InkWell(
                          onTap: () {
                            setState(() {
                              isHiddenPassword = !isHiddenPassword;
                            });
                          },
                          child: Icon(
                              isHiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xCACACA).withOpacity(0.6)),
                        ),
                      ),
                      SizedBox(
                        height: 57,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 28, right: 28),
                        width: width - 56,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final phone = phoneController.text;
                              final password = passwordController.text;
                              final country = "ETH";

                              context
                                  .read<LoginCubit>()
                                  .login(phone, password, country);
                            }
                          },
                          child: Text(
                            'SIGN IN',
                            style: ThemeText.Text1.copyWith(fontSize: 16),
                          ),
                          style: ThemeButton.primaryButtonStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    )));
  }
}
