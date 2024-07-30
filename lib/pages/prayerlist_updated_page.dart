// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:carousel_slider_app/components/neu_box.dart';
import 'package:carousel_slider_app/models/data.dart';
import 'package:carousel_slider_app/models/prayer_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrayerlistUpdated extends StatefulWidget {
  const PrayerlistUpdated({super.key});

  @override
  State<PrayerlistUpdated> createState() => _PrayerlistUpdatedState();
}

class _PrayerlistUpdatedState extends State<PrayerlistUpdated> {
  bool isLoading = false;
  var prayerTims = [];
  @override
  void initState() {
    initList();
    super.initState();
  }

  void initList() async {
    setState(() {
      isLoading = true;
    });
    var result = await rootBundle.loadString('assets/prayer.json');
    var response = jsonDecode(result);
    if (response['status'] == 'OK') {
      prayerTims = response['data'].map((e) => Data.fromJson(e)).toList();
      if (prayerTims.isNotEmpty) {
        print(prayerTims);
      } else {
        print('=====>error');
      }
    } else {
      print('Error code is ${response['code']}');
      return;
    }
//PrayerTime.fromJson(e)).tolist()
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('مواقيت الصلاة')),
        ),
        body: isLoading
            ? const CircularProgressIndicator()
            : ListView(
                children: prayerTims
                    .map(
                      (e) => ListTile(
                        title: NeuBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${e.timings?.fajr ?? ''} AM',
                                    ),
                                    const Text(
                                      'صلاة الفجر',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${e.timings?.sunrise ?? ''} AM',
                                    ),
                                    const Text(
                                      'الشروق',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${e.timings?.dhuhr ?? ''} PM',
                                    ),
                                    const Text(
                                      'صلاة الظهر',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${e.timings?.asr ?? ''} PM',
                                    ),
                                    const Text(
                                      'صلاة العصر',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${e.timings?.maghrib ?? ''} PM',
                                    ),
                                    const Text(
                                      'صلاة المغرب',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${e.timings?.isha ?? ''} PM',
                                    ),
                                    const Text(
                                      'صلاة العشاء',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${e.timings?.midnight ?? ''} AM',
                                    ),
                                    const Text(
                                      'منتصف الليل',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ));
  }
}
