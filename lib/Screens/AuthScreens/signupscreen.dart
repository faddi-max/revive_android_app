import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive_app/Blocs/AuthBlocs/Loginblocs.dart';
import 'package:revive_app/Blocs/AuthBlocs/signupbloc.dart';
import 'package:revive_app/Events/AuthEvents/signupevents.dart';
import 'package:revive_app/State/Revivestate.dart';
import 'package:revive_app/utils/Theme/Colors.dart';
import 'package:revive_app/widgets/ReviveBtton.dart';
import 'package:revive_app/widgets/ReviveField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _fullnamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController __phonenumbercontroller = TextEditingController();

  // focus nodes
  final FocusNode _fullnamefocusnode = FocusNode();
  final FocusNode _emailfocusnode = FocusNode();
  final FocusNode _passwordfocusnode = FocusNode();
  final FocusNode _phonenumberfocusnode = FocusNode();

  @override
  void dispose() {
    _fullnamefocusnode.dispose();
    _emailfocusnode.dispose();
    _passwordfocusnode.dispose();
    _phonenumberfocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _fullnamefocusnode.unfocus();
        _emailfocusnode.unfocus();
        _passwordfocusnode.unfocus();
        _phonenumberfocusnode.unfocus();
      },
      child: BlocConsumer<SignupBloc, Revivestate>(
        listener: (context, state) {
          if (state is ReviveLoaded) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Signup Successfull")));
          }

          if (state is ReviveError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },

        builder: (context, state) {
          if (state is ReviveLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.Primarycolor),
            );
          }
          return Scaffold(
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(width: 2),
                          Container(
                            height: 2.5,
                            width: 25,
                            decoration: BoxDecoration(
                              color: AppColors.Secondrycolor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
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
                            focusNode: _fullnamefocusnode,
                            controller: _fullnamecontroller,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Fullname is required';
                              }
                              return null;
                            },
                            label: 'Fullname',
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
                            focusNode: _emailfocusnode,
                            controller: _emailcontroller,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                            label: 'Email',
                            obscuretext: false,
                          ),
                        ),
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
                            focusNode: _phonenumberfocusnode,
                            controller: __phonenumbercontroller,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Phone Number is required';
                              }
                              return null;
                            },
                            label: 'Phone Number',
                            obscuretext: false,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),
                    Revivebutton(
                      label: 'Sign In',
                      onTap: () {
                        final fullname = _fullnamecontroller.text.trim();
                        final phonenumber = __phonenumbercontroller.text.trim();
                        final email = _emailcontroller.text.trim();
                        final password = _passwordcontroller.text.trim();
                        BlocProvider.of<SignupBloc>(context).add(
                          SignupRequested(
                            fullname: fullname,
                            phone: phonenumber,
                            email: email,
                            password: password,
                          ),
                        );
                      },
                      bgcolor: AppColors.Primarycolor,
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
