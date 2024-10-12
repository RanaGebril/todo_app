import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/register/creat_account.dart';
import 'package:todo_app/register/dialog_ui.dart';
import 'package:todo_app/register/text_field_ui.dart';

class LogIn extends StatelessWidget {
  static const String routeName = "login";
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("logIn".tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldUi(
                formController: emailController,
                lable: "email".tr(),
                keyboardtype: TextInputType.emailAddress,
              ),
              TextFieldUi(
                  formController: passwordController,
                  lable: "password".tr(),
                  keyboardtype: TextInputType.visiblePassword),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              DialogUi(message: "please fill in all fields"));
                      return;
                    }

                    FirebaseFunctions.logIn(
                      emailController.text,
                      passwordController.text,
                      onSuccess: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false,
                        );
                      },
                      onError: (message) {
                        showDialog(
                          context: context,
                          builder: (context) => DialogUi(message: message),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Appcolors.whiteColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Appcolors.blueColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "logIn".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Appcolors.whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.pushNamed(context,CreateAccount.routeName),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                    text: "doNotHaveAccount".tr(),
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "signUp".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Appcolors.blueColor))
              ])),
        ),
      ),
    );
  }
}
