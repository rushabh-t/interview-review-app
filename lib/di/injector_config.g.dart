// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => HomeBloc(c<UserUsecase>()));
    container.registerFactory((c) => RatingBloc());
    container.registerFactory((c) => FeedbackBloc());
  }

  @override
  void _configureUseCases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => UserUsecase(c<UserRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<UserRepository>((c) => UserRepositoryImpl(
        c<UserRemoteDataSource>(), c<UserLocalDataSource>()));
  }

  @override
  void _configureLocalDataSources() {}
  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => UserLocalDataSource(c<DBClient>()));
    container.registerSingleton((c) => UserRemoteDataSource(c<ApiClient>()));
  }

  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => ApiClient());
    container.registerSingleton((c) => DBClient());
  }
}
