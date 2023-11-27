import 'package:flutter_ddd_products/application/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// [di] is the dependency injection container.
///
/// It is used to register and resolve dependencies.
final di = GetIt.instance;

/// [configureDependencies] configures the dependency injection.
///
/// It is called in main function before the application is run.
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => di.init();
