import 'package:country_list/core/services/data_state.dart';
import 'package:country_list/features/countries/domain/entities/country_entity.dart';

abstract class CountryRepository {
  Future<DataState<List<CountryEntity>>> getCountries();
}