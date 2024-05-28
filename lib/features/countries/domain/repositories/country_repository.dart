import '/core/services/data_state.dart';
import '/features/countries/domain/entities/country_entity.dart';

abstract class CountryRepository {
  Future<DataState<List<CountryEntity>>> getCountries();
}