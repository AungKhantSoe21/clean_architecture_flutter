// ignore_for_file: unused_field
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:clean_architecture_flutter/features/countries/domain/entities/country_entity.dart';

import '../../../../core/utils/data_state/data_state.dart';
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

        // for (var item in responseData) {
        //   _countryLocalService.createItem(item);
        // }

        return DataSuccess(responseData);
      } else {
        return DataFailed(HttpException(
          response as String,
        ));
      }
    } on Exception catch (e) {
      log(e.toString());
      return DataFailed(e);
    }
  }

  @override
  List<CountryModel> searchCountries({required List<CountryEntity> data, required String key}) {
    List<CountryModel> searchedData = [];
    searchedData = data
        .where((e) => e.country!.toLowerCase().contains(key))
        .map<CountryModel>(
          (e) => CountryModel.fromEntity(e),
        )
        .toList();
    return searchedData;
  }
}
