import 'package:dio/dio.dart';
import 'package:smart_child_viewer/services/SVService.dart';

class AuthService extends SVService{

  AuthService(){
    dio = Dio();
  }

  Future getUserDataFromFacebook(String accessToken) {
    return dio.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$accessToken');
  }

  Future doFacebookLogin(Map data) {
    final String url = svConfig.endpoints['auth']['fbLogin'];
    return dio.post(url, data: data);
  }
}