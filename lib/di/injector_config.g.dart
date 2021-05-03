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
  }

  @override
  void _configureUseCases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => UserUsecase(c<UserRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<UserRepository>(
        (c) => UserRepositoryImpl(c<UserRemoteDataSource>()));
  }

  @override
  void _configureLocalDataSources() {}
  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => UserRemoteDataSource(c<ApiClient>()));
  }

  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => ApiClient());
  }
}
