import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _loginUrl = 'https://dummyjson.com/auth/login';

  static Future<String> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['accessToken'] as String;
      }
      final error = jsonDecode(response.body);
      final msg = error['message'] ?? 'Login failed (${response.statusCode})';
      throw Exception(msg);
    } on http.ClientException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      rethrow;
    }
  }
}
