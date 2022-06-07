import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class text_field_container extends StatelessWidget {
  Widget? child;

  text_field_container({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      width: size.width * 0.7,
      height: size.height * 0.08,
      decoration: BoxDecoration(
          color: AppColor.grey,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.black,
            width: 1,
          )),
      child: child,
    );
  }
}
