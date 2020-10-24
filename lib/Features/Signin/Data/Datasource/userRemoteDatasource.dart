import 'package:neopolis/Features/Signin/Domain/Entities/profileEntity.dart';

abstract class UserRemoteDataSource {
  Future<Profile> login(String email, String password);
  Future<String> logout(String idUser, String idSession);
}
