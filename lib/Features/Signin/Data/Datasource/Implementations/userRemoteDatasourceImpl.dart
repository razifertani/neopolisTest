import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mercury_client/mercury_client.dart';
import 'package:neopolis/Core/Error/exceptions.dart';
import 'package:neopolis/Core/Services/socialMediaService.dart';
import 'package:neopolis/Features/Signin/Data/Datasource/userRemoteDatasource.dart';
import 'package:http/http.dart' as http;
import 'package:neopolis/Features/Signin/Domain/Entities/profileEntity.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({@required this.client});

  @override
  Future<Profile> login(String email, String password) async {
    String idUser, idLanguage, idSession;

    var client = HttpClient('https://ws.interface-crm.com:444');

    var response = await client.get('email_sign_in', parameters: {
      'mail': email,
      'password': password,
    });

    if (response.status == 200) {
      idUser = json.decode(response.body)['id_user'];
      idLanguage = json.decode(response.body)['id_language'];
      idSession = json.decode(response.body)['idSession'];

      final responsee = await http.get(
        "https://ws.interface-crm.com:444/view_user?id_user=$idUser&idLanguage=$idLanguage",
        headers: {
          'Content-Type': 'application/json',
          'idSession': idSession,
        },
      );

      if (responsee.statusCode == 200) {
        final profile = Profile.fromJson(json.decode(responsee.body));
        profile.idUser = idUser;
        profile.idSession = idSession;
        profile.type = 'Email';
        return profile;
      } else if (responsee.statusCode == 401) {
        final profile = Profile(
          idUser: 'Session expired',
        );
        return profile;
      } else {
        throw ServerExeption();
      }
    } else if (response.status == 403) {
      if (json.decode(response.body)['message'] == 'User does not exist') {
        final profile = Profile(
          idUser: 'User does not exist',
        );
        return profile;
      }
      if (json.decode(response.body)['message'] == 'Wrong password') {
        final profile = Profile(
          idUser: 'Wrong password',
        );
        return profile;
      }
      final profile = Profile(
        idUser: 'Login issues',
      );
      return profile;
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Profile> loginGoogle(String test) async {
    Profile profile = await SocialMediaService().signInWithGoogle();
    return profile;
  }

  @override
  Future<Profile> loginFacebook(String test) async {
    Profile profile = await SocialMediaService().loginWithFB();
    return profile;
  }

  @override
  Future<String> logout(String type, String idUser, String idSession) async {
    if (type == 'Email') {
      final response = await http.get(
        "https://ws.interface-crm.com:444/view_user?id_user=$idUser",
        headers: {
          'Content-Type': 'application/json',
          'idSession': idSession,
        },
      );

      if (response.statusCode == 200) {
        final message = json.decode(response.body)['message'];
        return message;
      } else if (response.statusCode == 304) {
        final message = json.decode(response.body)['message'];
        return message;
      } else {
        throw ServerExeption();
      }
    }
    if (type == 'Google') {
      await SocialMediaService().signOutGoogle();
      return 'Success';
    }
    if (type == 'Facebook') {
      await SocialMediaService().facebookSignIn.logOut();
    }
    return 'Logout Error';
  }
}
