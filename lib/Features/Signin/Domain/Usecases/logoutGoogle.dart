import 'package:dartz/dartz.dart';
import 'package:neopolis/Core/Error/failure.dart';
import 'package:neopolis/Core/Usecases/usecases.dart';
import 'package:neopolis/Features/Signin/Domain/Repositories/userRepository.dart';

class LogoutGoogle implements Usescases<String, String> {
  final UserRepository userRepository;

  LogoutGoogle(this.userRepository);

  @override
  Future<Either<Failure, String>> call(String test) async {
    return await userRepository.logoutGoogle(test);
  }
}
