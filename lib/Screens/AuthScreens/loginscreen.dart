import 'package:flutter/material.dart';
import 'package:revive_app/utils/Theme/Colors.dart';
import 'package:revive_app/widgets/ReviveBtton.dart';
import 'package:revive_app/widgets/ReviveField.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _usernamefocusNode = FocusNode();
  final FocusNode _passwordfocusnode = FocusNode();

  @override
  void dispose() {
    _usernamefocusNode.dispose();
    _passwordfocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _usernamefocusNode.unfocus();
        _passwordfocusnode.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.BgColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Sign in to ReVive. Clear your closet, fill someone’s heart.",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: AppColors.Secondrycolor,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 2.5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.Primarycolor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      SizedBox(width: 2),
                      Container(
                        height: 2.5,
                        width: 25,
                        decoration: BoxDecoration(
                          color: AppColors.Secondrycolor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset(
                        'assets/images/new-gmail-icon.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Revivefield(
                        focusNode: _usernamefocusNode,
                        controller: _usernamecontroller,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'username is required';
                          }
                          return null;
                        },
                        label: 'User Name',
                        obscuretext: false,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/images/password-icon.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Revivefield(
                        focusNode: _passwordfocusnode,
                        controller: _passwordcontroller,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        label: 'Password',
                        obscuretext: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Revivebutton(
                  label: 'Sign In',
                  onTap: () {
                    print("Tapped");
                  },
                  bgcolor: AppColors.Primarycolor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
