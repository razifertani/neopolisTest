import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:neopolis/Core/Network/networkInfo.dart';
import 'package:neopolis/Core/Services/socialMediaService.dart';
import 'package:neopolis/Features/Signin/Data/Datasource/Implementations/userRemoteDatasourceImpl.dart';
import 'package:neopolis/Features/Signin/Data/Datasource/userRemoteDatasource.dart';
import 'package:neopolis/Features/Signin/Data/Repositories/userRepositoryImpl.dart';
import 'package:neopolis/Features/Signin/Domain/Repositories/userRepository.dart';
import 'package:neopolis/Features/Signin/Domain/Usecases/login.dart';
import 'package:neopolis/Features/Signin/Domain/Usecases/loginFacebook.dart';
import 'package:neopolis/Features/Signin/Domain/Usecases/loginGoogle.dart';
import 'package:neopolis/Features/Signin/Domain/Usecases/logout.dart';
import 'package:neopolis/Features/Signin/Presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;

void init() {
  //* ---------------------------------  Feature Sign in  --------------------------

  // ? Bloc
  sl.registerFactory(() => LoginBloc(
        login: sl(),
        loginGoogle: sl(),
        loginFacebook: sl(),
        logout: sl(),
      ));

  // ? Use cases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => LoginGoogle(sl()));
  sl.registerLazySingleton(() => LoginFacebook(sl()));
  sl.registerLazySingleton(() => Logout(sl()));

  // ? Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // ? Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  //*--------------------------------------- External  --------------------------------------
  sl.registerLazySingleton(() => SocialMediaService());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
