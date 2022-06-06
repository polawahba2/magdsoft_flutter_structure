// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

import '../../constants/end_points.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  account_model? user_model = account_model();
  bool is_password = true;
  var suffix_icon = Icons.visibility_off_outlined;

  void change_password_visibility() {
    is_password = !is_password;
    suffix_icon =
        is_password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: login, body: {
      'email': email,
      'password': password,
    }).then((value) {
      user_model = account_model.fromJson(value.data);
      print(user_model!.account![0].email);
      emit(LoginSucessState());
    }).catchError((error) {
      print('this is the error${error.toString()}');
      emit(LoginErrorState(error.toString()));
    });
  }

  void user_register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    emit(RegistrationLoadingState());
    DioHelper.postData(url: register, body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    }).then((value) {
      String registration_message = value.data['message'];
      emit(RegistrationSucessState(registration_message));
    }).catchError((error) {
      print(error.toString());
      emit(RegistrationErrorState());
    });
  }
}
