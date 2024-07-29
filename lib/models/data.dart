import 'package:carousel_slider_app/models/timings.dart';

class Data {
  Timings? timings;

  Data({this.timings});

  Data.fromJson(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
  }
}
