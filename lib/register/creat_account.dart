import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/register/dialog_ui.dart';
import 'package:todo_app/register/log_in.dart';
import 'package:todo_app/register/text_field_ui.dart';

class CreateAccount extends StatelessWidget {
  static const String routeName = "createAccount";

  CreateAccount({super.key});

  final userNameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("signUp".tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldUi(
                  formController: userNameController, lable: "UserName".tr()),
              TextFieldUi(
                formController: ageController,
                lable: "age".tr(),
                keyboardtype: TextInputType.number,
              ),
              TextFieldUi(
                formController: phoneController,
                lable: "phone".tr(),
                keyboardtype: TextInputType.phone,
              ),
              TextFieldUi(
                formController: emailController,
                lable: "email".tr(),
                keyboardtype: TextInputType.emailAddress,
              ),
              TextFieldUi(
                formController: passwordController,
                lable: "password".tr(),
                keyboardtype: TextInputType.visiblePassword,
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        userNameController.text.isEmpty ||
                        ageController.text.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              DialogUi(message: "please fill in all fields"));
                      return;
                    }
                    FirebaseFunctions.createAcount(
                        emailController.text, passwordController.text,
                        age: int.parse(ageController.text),
                        phone: phoneController.text,
                        userName: userNameController.text, onSuccess: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                      );
                    }, onError: (message) {
                      showDialog(
                          context: context,
                          builder: (context) => DialogUi(message: message));
                    });
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
                      "signUp".tr(),
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
        onTap: () => Navigator.pushNamed(context, LogIn.routeName),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: "haveAccount".tr(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: "logIn".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Appcolors.blueColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
