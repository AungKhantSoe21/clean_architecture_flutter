import '../../../../core/utils/data_state/data_state.dart';
import '/features/countries/domain/entities/country_entity.dart';
import '/features/countries/domain/repositories/country_repository.dart';

class CountryUsecases {
  
  final CountryRepository _countryRepository;

  CountryUsecases(this._countryRepository);
  
  Future<DataState<List<CountryEntity>>> getCountry() {
    return _countryRepository.getCountries();
  }

  List<CountryEntity> searchCountry({required List<CountryEntity> data, required String key}) {
    return _countryRepository.searchCountries(data: data, key: key);
  }
}