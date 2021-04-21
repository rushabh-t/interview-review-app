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
  void _configureBlocs();

  /// ============ Register UseCases ============
  void _configureUseCases();

  /// ============ Register Repositories ============
  void _configureRepositories();

  /// ============ Register LocalDataSources ============
  void _configureLocalDataSources();

  /// ============ Register RemoteDataSources ============
  void _configureRemoteDataSources();

  /// ============ Register Common Classes ============
  @Register.singleton(ApiClient)
  void _configureCommon();
}
