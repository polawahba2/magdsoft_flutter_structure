import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/custom_button.dart';
import 'package:magdsoft_flutter_structure/constants/text_field_container.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class login_screen extends StatelessWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      text_field_container(
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      text_field_container(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            suffixIcon: Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      custom_button(text: 'Register'),
                      custom_button(text: 'Login'),
                    ],
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
