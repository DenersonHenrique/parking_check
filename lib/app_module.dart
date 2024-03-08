import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'commons/adapters/storage/storage_adapter.dart';
import 'commons/adapters/storage/storage_client.dart';
import 'modules/home/home_module.dart';
import 'modules/home/presentation/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<SharedPreferences>(SharedPreferences.getInstance);

    i.addSingleton<IStorageClient>(StorageAdapter.new);

    // i.addSingleton<IStorageClient<String>>(
    //   StorageAdapter.new,
    // );
  }

  @override
  List<Module> get imports => [
        HomeModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
    r.module(
      '/home',
      module: HomeModule(),
    );
  }
}
