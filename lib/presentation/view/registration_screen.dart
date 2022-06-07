// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';

import '../../constants/text_field_container.dart';
import '../styles/colors.dart';

class registration_screen extends StatelessWidget {
  registration_screen({Key? key}) : super(key: key);
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();
  GlobalKey<FormState> register_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is RegistrationSucessState &&
            state.message != "Account Created Successfully") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is RegistrationSucessState &&
            state.message == "Account Created Successfully") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      builder: (context, state) {
        var my_cubit = GlobalCubit.get(context);

        return Scaffold(
          backgroundColor: AppColor.blue,
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.blue,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/flutter_logo.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.66,
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Form(
                          key: register_key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  text_field_container(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'enter valid name';
                                        }
                                        return null;
                                      },
                                      controller: name_controller,
                                      textAlign: TextAlign.left,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Full Name',
                                      ),
                                    ),
                                  ),
                                  text_field_container(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            !value.contains('@')) {
                                          return 'enter valid Email';
                                        }
                                        return null;
                                      },
                                      controller: email_controller,
                                      textAlign: TextAlign.left,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                      ),
                                    ),
                                  ),
                                  text_field_container(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length < 11) {
                                          return 'phone should be more than 10 numbers';
                                        }
                                        return null;
                                      },
                                      controller: phone_controller,
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'phone',
                                      ),
                                    ),
                                  ),
                                  text_field_container(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length < 6) {
                                          return 'pass should be more than 10 numbers';
                                        }
                                        return null;
                                      },
                                      obscureText:
                                          GlobalCubit.get(context).is_password,
                                      controller: password_controller,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                        suffixIcon: IconButton(
                                          icon: Icon(my_cubit.suffix_icon),
                                          onPressed: () {
                                            my_cubit
                                                .change_password_visibility();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  text_field_container(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value != password_controller.text) {
                                          return 'passwords are not identical';
                                        }
                                        return null;
                                      },
                                      controller: confirm_password_controller,
                                      obscureText:
                                          GlobalCubit.get(context).is_password,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Confirm Password',
                                        suffixIcon: IconButton(
                                          icon: Icon(my_cubit.suffix_icon),
                                          onPressed: () {
                                            my_cubit
                                                .change_password_visibility();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  state is RegistrationLoadingState
                                      ? const CircularProgressIndicator()
                                      : custom_button(
                                          text: 'Register',
                                          press: () {
                                            if (register_key.currentState!
                                                .validate()) {
                                              GlobalCubit.get(context)
                                                  .user_register(
                                                name: name_controller.text,
                                                email: email_controller.text,
                                                phone: phone_controller.text,
                                                password:
                                                    password_controller.text,
                                              );
                                            }
                                          },
                                        ),
                                  custom_button(
                                    text: 'Login',
                                    press: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
