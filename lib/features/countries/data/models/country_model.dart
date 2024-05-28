import '/core/constants/db_constants.dart';
import '/features/countries/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    super.id,
    super.country,
    super.countryCode,
    super.image,
  });

  factory CountryModel.fromDbJson(Map<String, dynamic> item) {
    return CountryModel(
      id: item[DBConstants.countryTblColumn[0]],
      country: item[DBConstants.countryTblColumn[1]],
      countryCode: item[DBConstants.countryTblColumn[2]],
      image: item[DBConstants.countryTblColumn[3]],
    );
  }

  factory CountryModel.fromAPIJson(Map<String, dynamic> item) {
    return CountryModel(
      id: "${item["name"]["official"]}${item["name"]["common"]}",
      country: item["name"]["official"] ?? "",
      countryCode: item["cca2"] ?? "",
      image: item["flags"]["png"] ?? "",
    );
  }

  Map<String, Object> toJson() {
    return {
      DBConstants.countryTblColumn[0]: id ?? "",
      DBConstants.countryTblColumn[1]: country ?? "",
      DBConstants.countryTblColumn[2]: countryCode ?? "",
      DBConstants.countryTblColumn[3]: image ?? "",
    };
  }
}
