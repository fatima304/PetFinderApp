import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_image_model.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_weight_model.dart';
import 'package:pet_finder_app/features/home/data/repository/cat_repository.dart';
import 'package:pet_finder_app/features/home/presentation/manager/cubit/cat_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/manager/cubit/cat_state.dart';

class _MockCatRepository extends Mock implements CatRepository {}

void main() {
  late _MockCatRepository mockRepository;

  setUp(() {
    mockRepository = _MockCatRepository();
  });

  final sampleCats = [
    CatModelNew(
      id: 'abys',
      name: 'Abyssinian',
      origin: 'Egypt',
      lifeSpan: '14',
      weight: CatWeightModel(imperial: '7 - 10', metric: '3 - 5'),
      image: CatImageModel(
        id: 'img1',
        url: 'https://example.com/img.jpg',
        width: 500,
        height: 500,
      ),
    ),
  ];

  test('initial state is CatInitial', () {
    final cubit = CatCubit(mockRepository);
    expect(cubit.state, const CatInitial());
    cubit.close();
  });

  blocTest<CatCubit, CatState>(
    'emits [CatLoading, CatSuccess] when getCatBreeds succeeds',
    build: () {
      when(() => mockRepository.getCatBreeds()).thenAnswer((_) async => sampleCats);
      return CatCubit(mockRepository);
    },
    act: (cubit) => cubit.getCatBreeds(),
    expect: () => [
      const CatLoading(),
      isA<CatSuccess>().having((s) => s.cats, 'cats', sampleCats),
    ],
    verify: (_) {
      verify(() => mockRepository.getCatBreeds()).called(1);
    },
  );

  blocTest<CatCubit, CatState>(
    'emits [CatLoading, CatFailure] when getCatBreeds fails',
    build: () {
      when(() => mockRepository.getCatBreeds()).thenThrow(Exception('boom'));
      return CatCubit(mockRepository);
    },
    act: (cubit) => cubit.getCatBreeds(),
    expect: () => [
      const CatLoading(),
      isA<CatFailure>(),
    ],
    verify: (_) {
      verify(() => mockRepository.getCatBreeds()).called(1);
    },
  );
}


