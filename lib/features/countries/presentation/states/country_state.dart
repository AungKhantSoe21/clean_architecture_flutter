import 'package:country_list/core/services/data_state.dart';
import 'package:country_list/features/countries/domain/entities/country_entity.dart';
import 'package:country_list/features/countries/domain/usecases/get_country_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

// final fetchingState = StateProvider<bool>((ref) => true);

// final localResourceProvider = Provider<CountryDataResourcesLocal>((ref) => CountryDataResourcesLocal());
// final apiResourceProvider = Provider<CountryDataSourceRemote>((ref) => CountryDataSourceRemote());
// final repoProvider = Provider<CountryRepository>((ref) => CountryRepositoryImpl(ref.watch(apiResourceProvider), ref.watch(localResourceProvider)));
// final usecaseProvider = Provider<GetCountryUsecase>((ref) => GetCountryUsecase(ref.watch(repoProvider)));

final countryDataState = FutureProvider<DataState<List<CountryEntity>>>((ref) async {
  GetIt getIt = GetIt.instance;
  return getIt.get<GetCountryUsecase>().call();
});