import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../domain/entities/car_space_entity.dart';

class HomeState extends ViewModelState {
  factory HomeState.initial() => const HomeState();
  final bool hasError;
  final bool isLoading;
  final List<CarSpaceEntity> spaceList;

  const HomeState({
    this.hasError = false,
    this.isLoading = false,
    this.spaceList = const [],
  });

  HomeState copyWith({
    bool? hasError,
    bool? isLoading,
    List<CarSpaceEntity>? spaceList,
  }) {
    return HomeState(
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      spaceList: spaceList ?? this.spaceList,
    );
  }
}
