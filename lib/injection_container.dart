import 'package:get_it/get_it.dart';

import 'providers/product_providers.dart';

final sl = GetIt.I;

Future<void> init() async {
  //! register classes
  sl.registerLazySingleton(() => ProductProviders());

  //! initialize data
  await sl.get<ProductProviders>().initialize();
}
