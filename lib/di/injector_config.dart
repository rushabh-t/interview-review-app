import 'package:interview_review_app/data/datasources/user_remote_data_source.dart';
import 'package:interview_review_app/data/repositories/user_repository_impl.dart';
import 'package:interview_review_app/domain/respositories/user_repository.dart';
import 'package:interview_review_app/domain/usecases/user_usecase.dart';
import 'package:interview_review_app/presentation/journey/home/bloc/home_bloc.dart';
import 'package:kiwi/kiwi.dart';

import 'package:interview_review_app/network/api/api_client.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    // ignore: cascade_invocations
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureBlocs();
    _configureUseCases();
    _configureRepositories();
    _configureLocalDataSources();
    _configureRemoteDataSources();
    _configureCommon();
  }

  /// ============ Register Blocs ============
  @Register.factory(HomeBloc)
  void _configureBlocs();

  /// ============ Register UseCases ============
  @Register.singleton(UserUsecase)
  void _configureUseCases();

  /// ============ Register Repositories ============
  @Register.singleton(UserRepository, from: UserRepositoryImpl)
  void _configureRepositories();

  /// ============ Register LocalDataSources ============
  void _configureLocalDataSources();

  /// ============ Register RemoteDataSources ============
  @Register.singleton(UserRemoteDataSource)
  void _configureRemoteDataSources();

  /// ============ Register Common Classes ============
  @Register.singleton(ApiClient)
  void _configureCommon();
}
