import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repo/auth_repo.dart';
import '../models/user.dart';

final authProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final loginProvider = FutureProvider.autoDispose
    .family<User, Map<String, dynamic>>((ref, credentials) async {
  final authRepo = ref.read(authProvider);
  return authRepo.login(
      credentials['email']!, credentials['password']!, credentials['value']!);
});
final fetchProvider = FutureProvider.autoDispose
    .family<User, Map<String, String>>((ref, credentials) async {
  final authRepo = ref.read(authProvider);
  return authRepo.fetchUser();
});

final signupProvider = FutureProvider.autoDispose
    .family<void, Map<String, String>>((ref, credentials) async {
  final authRepo = ref.read(authProvider);
  return authRepo.signup(
      credentials['name']!, credentials['email']!, credentials['password']!);
});
