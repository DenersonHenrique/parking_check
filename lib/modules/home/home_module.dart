import 'package:flutter_modular/flutter_modular.dart';

import '../../commons/adapters/storage/storage_client.dart';
import 'data/datasource/car_spaces_local_datasource.dart';
import 'data/repository/car_spaces_repository.dart';
import 'domain/repository/car_spaces_respository.dart';
import 'domain/usecases/get_car_spaces_usecase.dart';
import 'domain/usecases/save_car_spaces_usecase.dart';
import 'presentation/home_page.dart';
import 'presentation/home_viewmodel.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ICarSpacesLocalDatasource>(
      () => CarSpacesLocalDatasource(
        i.get<IStorageClient<String>>(),
      ),
    );
    i.addLazySingleton<ICarSpacesRepository>(CarSpacesRepository.new);
    i.addSingleton<IGetCarSpacesUsecase>(GetCarSpacesUsecase.new);
    i.addSingleton<ISaveCarSpacesUsecase>(SaveCarSpacesUsecase.new);
    i.addSingleton<HomeViewModel>(HomeViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
  }
}
