import 'package:dartz/dartz.dart';
import 'package:neopolis/Core/Error/failure.dart';
import 'package:neopolis/Features/Signin/Domain/Entities/profileEntity.dart';

abstract class UserRepository {
  Future<Either<Failure, Profile>> login(String email, String password);
  Future<Either<Failure, Profile>> loginGoogle(String test);
  Future<Either<Failure, Profile>> loginFacebook(String test);
  Future<Either<Failure, String>> logout(
      String type, String idUser, String idSession);
}
