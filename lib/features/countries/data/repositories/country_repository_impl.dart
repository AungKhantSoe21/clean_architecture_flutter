import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '/core/services/data_state.dart';
import '/features/countries/data/data_sources/local/country_local_data_resources.dart';
import '/features/countries/data/data_sources/remote/country_remote_data_source.dart';
import '/features/countries/data/models/country_model.dart';
import '/features/countries/domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryDataSourceRemote _countryApiService;
  final CountryDataResourcesLocal _countryLocalService;
  CountryRepositoryImpl(this._countryApiService, this._countryLocalService);

  @override
  Future<DataState<List<CountryModel>>> getCountries() async {
    try {
      final response = await _countryApiService.getCountries();
      var data = json.decode(response.body);
      
      if (response.statusCode == HttpStatus.ok) {
        List<CountryModel> responseData = data.map<CountryModel>((e) => CountryModel.fromAPIJson(e)).toList();
        
        responseData = responseData..sort((a, b) => a.country!.compareTo(b.country!));
        
        for (var item in responseData) {
          _countryLocalService.createItem(item);
        }

        return DataSuccess(responseData);
      } else {
        return DataFailed(
          HttpException(
            response as String,
          )
        );
      }
    } on Exception catch (e) {
      log(e.toString());
      return DataFailed(e);
    }
  }
  
}