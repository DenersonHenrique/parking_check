import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../domain/entities/car_space_entity.dart';
import '../domain/usecases/get_car_spaces_usecase.dart';
import '../domain/usecases/save_car_spaces_usecase.dart';
import 'home_state.dart';

class HomeViewModel extends ViewModel<HomeState> {
  final IGetCarSpacesUsecase _getCarSpacesUsecase;
  final ISaveCarSpacesUsecase _saveCarSpacesUsecase;

  HomeViewModel(
    this._getCarSpacesUsecase,
    this._saveCarSpacesUsecase,
  ) : super(HomeState.initial());

  @override
  void initViewModel() {
    super.initViewModel();
    fetchSpaceList();
  }

  void fetchSpaceList() async {
    emit(state.copyWith(isLoading: true));

    try {
      await Future.delayed(const Duration(seconds: 5));

      final result = await _getCarSpacesUsecase();
      emit(state.copyWith(spaceList: result));
    } catch (error) {
      emit(state.copyWith(hasError: true));
    }

    emit(state.copyWith(isLoading: false));
  }

  void saveSpaces(int count, String key) async {
    emit(state.copyWith(isLoading: true));

    try {
      generateEntityList(count);
      await _saveCarSpacesUsecase(key, state.spaceList);
    } catch (error) {
      emit(state.copyWith(hasError: true));
    }

    emit(state.copyWith(isLoading: false));
  }

  void generateEntityList(int count) {
    final List<CarSpaceEntity> list = <CarSpaceEntity>[];

    for (int index = 0; index < count; index++) {
      list.add(
        CarSpaceEntity(
          id: index + 1,
          number: '${index + 1}',
          isAvailable: true,
          vehicle: null,
        ),
      );
    }

    emit(state.copyWith(spaceList: list));
  }
}
