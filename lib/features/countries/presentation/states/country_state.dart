import '../../../../core/utils/data_state/data_state.dart';
import '/features/countries/domain/entities/country_entity.dart';
import '../../domain/usecases/country_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

// final fetchingState = StateProvider<bool>((ref) => true);
// final localResourceProvider = Provider<CountryDataResourcesLocal>((ref) => CountryDataResourcesLocal());
// final apiResourceProvider = Provider<CountryDataSourceRemote>((ref) => CountryDataSourceRemote());
// final repoProvider = Provider<CountryRepository>((ref) => CountryRepositoryImpl(ref.watch(apiResourceProvider), ref.watch(localResourceProvider)));
// final usecaseProvider = Provider<GetCountryUsecase>((ref) => GetCountryUsecase(ref.watch(repoProvider)));

class CountryState {
  // country data using future provider
  static final countryData = FutureProvider<DataState<List<CountryEntity>>>(
    (ref) async => GetIt.instance.get<CountryUsecases>().getCountry(),
  );

  // change searching state using state notifier
  static final searchState = StateNotifierProvider<SearchState, bool>(
    (ref) => SearchState(),
  );

  // searched data with
  static final searchData = NotifierProvider<SearchDataState, List<CountryEntity>>(
    () => SearchDataState(),
  );
}

class SearchState extends StateNotifier<bool> {
  SearchState() : super(false);
  void changeState(bool isSearching) {
    state = isSearching;
  }
}

class SearchDataState extends Notifier<List<CountryEntity>> {
  @override
  List<CountryEntity> build() => [];

  void search({required String key}) async {
    // get current fetched country data
    final data = ref.watch(CountryState.countryData);
    List<CountryEntity> currentFetchedData = [];
    data.whenData((d) {
      currentFetchedData = d.data!;
    });

    // give user loading state whe start searching
    ref.read(CountryState.searchState.notifier).changeState(true);

    // search countries base on key
    state = GetIt.instance.get<CountryUsecases>().searchCountry(data: currentFetchedData, key: key);
    ref.read(CountryState.searchState.notifier).changeState(false);
  }
}
