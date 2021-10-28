class SVConfig {
  static String apiUrl = 'http://192.168.2.188:8000/api';
  static String publicUrl = 'http://192.168.2.188:8000/public/';

  Map<String, dynamic> endpoints = {
    'auth': {
      'fbLogin': '$apiUrl/auth/fb-login', // POST
      'register': '$apiUrl/auth/register', // POST
      'login': '$apiUrl/auth/login', // POST
    }
  };
}