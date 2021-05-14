import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/login_request.dart';
import 'package:devicepe_client/repositories/network/models/login_response.dart';
import 'package:devicepe_client/repositories/network/models/otp_validate_request.dart';
import 'package:devicepe_client/repositories/network/models/otp_validate_response.dart';
import 'package:devicepe_client/repositories/network/models/register_request.dart';
import 'package:devicepe_client/repositories/network/models/register_response.dart';
import 'package:dio/dio.dart';

class AuthenticationService {
  static Future<RegisterResponse?> registerUser(
      RegisterRequest registerRequest) async {
    print("Api Call");
    try {
      Response<String> response =
          await ApiClient.dio.post<String>(REGISTER, data: registerRequest);
      if (response.data == null)
        return null;
      else
        return registerResponseFromJson(response.data!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<OtpValidateResponse?> validateOtp(
      OtpValidateRequest otpValidateRequest) async {
    print("Api Call");
    try {
      Response<String> response = await ApiClient.dio
          .post<String>(VALIDATE_OTP, data: otpValidateRequest);
      if (response.data == null)
        return null;
      else
        return otpValidateResponseFromJson(response.data!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<LoginResponse?> login(LoginRequest loginRequest) async {
    print("Api Call");
    try {
      Response<String> response =
          await ApiClient.dio.post<String>(LOGIN, data: loginRequest);
      if (response.data == null)
        return null;
      else
        return loginResponseFromJson(response.data!);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
