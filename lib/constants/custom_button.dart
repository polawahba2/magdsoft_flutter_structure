import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class custom_button extends StatelessWidget {
  final String text;
  VoidCallback? press;
  Color color;

  custom_button({
    Key? key,
    this.text = 'LogIg',
    this.press,
    this.color = AppColor.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.07,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        onPressed: press,
        elevation: 0,
        child: Text(
          text,
          style: const TextStyle(
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
