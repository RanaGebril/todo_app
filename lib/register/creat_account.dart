import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/providers/My_provider.dart';
import 'package:todo_app/register/dialog_ui.dart';
import 'package:todo_app/register/text_field_ui.dart';

class CreateAccount extends StatelessWidget {
  static const String routeName = "createAccount";

  CreateAccount({super.key});

  final userNameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("signUp".tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldUi(
                    formController: userNameController,
                    lable: "UserName".tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a username";
                    } else if (value.length < 5) {
                      return "Username should be at least 5 characters";
                    }
                    return null;
                  },
                ),
                TextFieldUi(
                  formController: ageController,
                  lable: "age".tr(),
                  keyboardtype: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your age";
                    }
                    try {
                      int age = int.parse(value);
                      if (age < 18) {
                        return "User should be at least 18 years old";
                      }
                    } catch (e) {
                      return "Age must be a number";
                    }
                    return null;
                  },

                ),
                TextFieldUi(
                  formController: phoneController,
                  lable: "phone".tr(),
                  keyboardtype: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your phone number";
                    } else if (value.length != 11 || !value.startsWith(RegExp(r"^(010|011|012|015)"))) {
                      return "Incorrect phone number format";
                    }
                    return null;
                  },

                ),
                TextFieldUi(
                  formController: emailController,
                  lable: "email".tr(),
                  keyboardtype: TextInputType.emailAddress,
                  validator:(value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email address";
                    }
                    bool emailValid =
                    RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail+\.com")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "unvalid email";
                    }
                    return null;
                  }
                ),
                TextFieldUi(
                  formController: passwordController,
                  lable: "password".tr(),
                  keyboardtype: TextInputType.visiblePassword,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    bool passwordValid=
                    RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value);
                    if (!passwordValid) {
                      return "Password must contain at least 8 characters, including uppercase, lowercase, digit, and symbol";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
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
                            userName: userNameController.text,
                            onSuccess: () async {
                              await provider_object.userData();
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
                      }
                     // if()
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
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.pop,
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
