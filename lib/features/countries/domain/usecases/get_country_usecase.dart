import '/core/services/data_state.dart';
import '/core/services/usecase.dart';
import '/features/countries/domain/entities/country_entity.dart';
import '/features/countries/domain/repositories/country_repository.dart';

class GetCountryUsecase implements UseCase<DataState<List<CountryEntity>>, void>{
  
  final CountryRepository _countryRepository;

  GetCountryUsecase(this._countryRepository);
  
  @override
  Future<DataState<List<CountryEntity>>> call({void params}) {
    return _countryRepository.getCountries();
  }
  
}