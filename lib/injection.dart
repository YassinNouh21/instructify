import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/auth/i_auth_facade.dart';
import 'package:instructify/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection(String eni) {
  $initGetIt(getIt, environment: eni);
}
