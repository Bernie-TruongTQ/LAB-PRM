class AuthService {
  static Future<String> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'user@example.com' && password == 'password123') {
      return 'mock_token_abc123';
    }
    throw Exception('Invalid credentials. Use user@example.com / password123');
  }
}
