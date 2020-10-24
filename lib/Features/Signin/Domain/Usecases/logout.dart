import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:neopolis/Core/Error/failure.dart';
import 'package:neopolis/Core/Usecases/usecases.dart';
import 'package:neopolis/Features/Signin/Domain/Repositories/userRepository.dart';

class Logout implements Usescases<String, Paramss> {
  final UserRepository userRepository;

  Logout(this.userRepository);

  @override
  Future<Either<Failure, String>> call(Paramss paramss) async {
    return await userRepository.logout(
        paramss.type, paramss.idUser, paramss.idSession);
  }
}

class Paramss extends Equatable {
  final String type;
  final String idUser;
  final String idSession;

  Paramss({this.type, @required this.idUser, @required this.idSession})
      : super([type, idUser, idSession]);
}
