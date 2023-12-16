import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String phone, String password, String country) async {
    emit(LoginLoading());

    try {
      final response = await http.post(
        Uri.parse('https://stagingapi.chipchip.social/v1/users/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'phone': phone,
          'password': password,
          'country': country,
        }),
      );

      if (response.statusCode == 200) {
        print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
        Map<dynamic, dynamic> userData = jsonDecode(response.body);
        var token = userData["data"]["token"];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access', token);
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: 'Login failed'));
      }
    } catch (error) {
      inspect(e);
      emit(LoginFailure(error: 'Something went wrong'));
    }
  }
}
