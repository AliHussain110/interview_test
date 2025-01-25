import '../api/api_services.dart';
import '../models/user.dart';

class AuthRepository {
  final ApiServices _apiService = ApiServices();

  Future<User> login(String email, String password, bool value) async {
    return _apiService.login(email, password, value);
  }

  Future<User> fetchUser() async {
    return _apiService.fetchUser();
  }

  Future<void> signup(String name, String email, String password) async {
    return _apiService.signup(name, email, password);
  }
}
