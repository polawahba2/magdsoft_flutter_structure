import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/constants/text_field_container.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class login_screen extends StatelessWidget {
  GlobalKey<FormState> login_key = GlobalKey<FormState>();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is LoginSucessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('login successful'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacementNamed(context, '/user_profile');
        }
        if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email or Password is not true'),
              backgroundColor: Colors.red,
            ),
          );
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
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Form(
                      key: login_key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              text_field_container(
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  controller: email_controller,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    alignLabelWithHint: false,
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@')) {
                                      return 'enter valid Email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              text_field_container(
                                child: TextFormField(
                                  controller: password_controller,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
                                      icon: Icon(my_cubit.suffix_icon),
                                      onPressed: () {
                                        my_cubit.change_password_visibility();
                                      },
                                    ),
                                  ),
                                  obscureText: my_cubit.is_password,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 5) {
                                      return 'password should be more than 5 numbers';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              custom_button(
                                  text: 'Register',
                                  press: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/registration_screen');
                                  }),
                              state is LoginLoadingState
                                  ? const CircularProgressIndicator()
                                  : custom_button(
                                      text: 'Login',
                                      press: () {
                                        if (login_key.currentState!
                                            .validate()) {
                                          my_cubit.userLogin(
                                            email: email_controller.text,
                                            password: password_controller.text,
                                          );
                                        }
                                      },
                                    ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
