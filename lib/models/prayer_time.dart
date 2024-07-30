import 'package:carousel_slider_app/models/data.dart';

class PrayerTime {
  int? code;
  String? status;
  List<Data>? data;

  PrayerTime({this.code, this.status, this.data});

  PrayerTime.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}
//        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    // data = json['data'] != null ? Data.fromJson(json['data']) : null;
