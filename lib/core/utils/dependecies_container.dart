import '/features/countries/data/data_sources/local/country_local_data_resources.dart';
import '/features/countries/data/data_sources/remote/country_remote_data_source.dart';
import '/features/countries/data/repositories/country_repository_impl.dart';
import '/features/countries/domain/repositories/country_repository.dart';
import '../../features/countries/domain/usecases/country_usecase.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeDependencies() async {
  final sl = GetIt.instance;

  // Dependencies
  sl.registerSingleton<CountryDataSourceRemote>(CountryDataSourceRemote());
  sl.registerSingleton<CountryDataResourcesLocal>(CountryDataResourcesLocal());

  sl.registerSingleton<CountryRepository>(
    CountryRepositoryImpl(sl(),sl())
  );
  
  //UseCases
  sl.registerSingleton<CountryUsecases>(
    CountryUsecases(sl())
  );
}