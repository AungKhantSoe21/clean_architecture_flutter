import '../../../../core/utils/data_state/data_state.dart';
import '/features/countries/domain/entities/country_entity.dart';
import '/features/countries/domain/repositories/country_repository.dart';

class GetCountryUsecase {
  
  final CountryRepository _countryRepository;

  GetCountryUsecase(this._countryRepository);
  
  Future<DataState<List<CountryEntity>>> getCall() {
    return _countryRepository.getCountries();
  }
}