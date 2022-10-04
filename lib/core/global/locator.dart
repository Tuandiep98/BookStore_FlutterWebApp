import 'package:get_it/get_it.dart';

import 'locator_rest_client.dart';
import 'locator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  registerRestClient();
  // registerDaoSingletons(locator);
  registerServiceSingletons(locator);
}
