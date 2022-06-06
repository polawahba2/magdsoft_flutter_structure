import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';

import '../../styles/user_prifile_text_style.dart';

class user_profile extends StatelessWidget {
  const user_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: const Text('User Data'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  ('Name : ${GlobalCubit.get(context).user_model!.account![0].name}'),
                  style: user_profile_text_style,
                ),
                Text(
                  ('Email : ${GlobalCubit.get(context).user_model!.account![0].email}'),
                  style: user_profile_text_style,
                ),
                Text(
                  ('Phone : ${GlobalCubit.get(context).user_model!.account![0].phone}'),
                  style: user_profile_text_style,
                ),
              ],
            ),
            custom_button(
              color: AppColor.logout_button_color,
              text: 'Logout',
              press: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
