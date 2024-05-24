import 'dart:convert';

class RegionalSummary {
  final String id;
  final String regionCode;
  final String region;
  final int totalVoters;
  final int female;
  final int male;

  RegionalSummary({
    required this.id,
    required this.regionCode,
    required this.region,
    required this.totalVoters,
    required this.female,
    required this.male,
  });

  factory RegionalSummary.fromJson(Map<String, dynamic> json) {
    return RegionalSummary(
      id: json['id'],
      regionCode: json['regioncode'],
      region: json['region'],
      totalVoters: json['total_voters'],
      female: json['female'],
      male: json['male'],
    );
  }
}
class AgeSummary {
  final String id;
  final String age_group;
  final int count;

  AgeSummary({required this.id, required this.age_group, required this.count});

  factory AgeSummary.fromJson(Map<String, dynamic> json) {
    return AgeSummary(
      id: json['id'],
      age_group: json['age_group'],
      count: json['count'],
    );
  }
}
class SearchSummary {
  final int id;
  final String name;
  final String constituency;
  final String region;
  final String pscode;
  final String psname;
  final String voterid;
  final String sex;
  final String image;
  final int age;

  SearchSummary({required this.image, required this.sex,required this.psname,required this.name,required this.constituency, required this.region, required this.pscode, required this.voterid, required this.age, required this.id} );
  factory SearchSummary.fromJson(Map<String, dynamic> json) {
    return SearchSummary(
      id: json['id'],
      name: json['name'],
      constituency: json['constituency'],
      region: json['region'],
      pscode: json['pscode'],
      psname: json['psname'],
      voterid: json['voterid'],
      age: json['age'],
      sex: json['sex'],
      image: json['image'],
    );
  }
}



class RegionalSummaryResponse {
  final List<RegionalSummary> regionalSummary;

  RegionalSummaryResponse({required this.regionalSummary});

  factory RegionalSummaryResponse.fromJson(Map<String, dynamic> json) {
    var list = json['regionalSummary'] as List;
    List<RegionalSummary> regionalSummaryList = list.map((i) => RegionalSummary.fromJson(i)).toList();
    return RegionalSummaryResponse(regionalSummary: regionalSummaryList);
  }
}
class SearchSummaryResponse {
  final List<SearchSummary> searchSummary;
  SearchSummaryResponse({required this.searchSummary});

  factory SearchSummaryResponse.fromJson(Map<String, dynamic> json) {
    var list = json['regionalSummary'] as List;
    List<SearchSummary> regionalSummaryList = list.map((i) => SearchSummary.fromJson(i)).toList();
    return SearchSummaryResponse(searchSummary: regionalSummaryList);
  }
}
class AgereResponse {
  final List<AgeSummary> agesuSummary;

  AgereResponse({required this.agesuSummary});

  factory AgereResponse.fromJson(Map<String, dynamic> json) {
    var list = json['regionalSummary'] as List;
    List<AgeSummary> regionalSummaryList = list.map((i) => AgeSummary.fromJson(i)).toList();
    return AgereResponse(agesuSummary: regionalSummaryList);
  }
}




