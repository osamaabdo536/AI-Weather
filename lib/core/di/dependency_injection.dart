import 'package:get_it/get_it.dart';
import 'package:weather/core/network/firebase_utils.dart';
import 'package:weather/feature/auth/login/data/data_source/login_remote_data_source.dart';
import 'package:weather/feature/auth/login/data/data_source/login_remote_data_source_impl.dart';
import 'package:weather/feature/auth/login/data/repos/login_repo_impl.dart';
import 'package:weather/feature/auth/login/domain/repos/login_repo.dart';
import 'package:weather/feature/auth/register/data/data_source/register_remote_data_source.dart';
import 'package:weather/feature/auth/register/data/data_source/register_remote_data_source_impl.dart';
import 'package:weather/feature/auth/register/data/repos/register_repo_impl.dart';

import '../../feature/auth/register/domain/repos/register_repo.dart';

class DependencyInjection {
  final getIt = GetIt.instance;

  void configure() {
    getIt.registerLazySingleton<RegisterRemoteDataSource>(() =>
        RegisterRemoteDataSourceImpl(
            firebaseUtils: FirebaseUtils.getInstance()));

    getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(
        registerRemoteDataSource: getIt<RegisterRemoteDataSource>()));

    getIt.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl(firebaseUtils: FirebaseUtils.getInstance()));

    getIt.registerLazySingleton<LoginRepo>(() =>
        LoginRepoImpl(loginRemoteDataSource: getIt<LoginRemoteDataSource>()));
  }
}
