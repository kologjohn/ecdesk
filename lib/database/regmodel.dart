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



class RegionalSummaryResponse {
  final List<RegionalSummary> regionalSummary;

  RegionalSummaryResponse({required this.regionalSummary});

  factory RegionalSummaryResponse.fromJson(Map<String, dynamic> json) {
    var list = json['regionalSummary'] as List;
    List<RegionalSummary> regionalSummaryList = list.map((i) => RegionalSummary.fromJson(i)).toList();
    return RegionalSummaryResponse(regionalSummary: regionalSummaryList);
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



