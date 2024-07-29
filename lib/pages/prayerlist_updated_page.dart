// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:carousel_slider_app/components/neu_box.dart';
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
  List<PrayerTime> prayerTims = [];
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
      prayerTims = List<PrayerTime>.from(
          response['data'].map((e) => PrayerTime.fromJson(e)).tolist());

      print(prayerTims);
      print('code is ${response['code']}');
    } else {
      print('Error code is ${response['code']}');
      return;
    }

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
                                      e.data?.first.timings?.fajr ?? '',
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
                                      e.data?.first.timings?.fajr ?? '',
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
                                      e.data?.first.timings?.fajr ?? '',
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
                                      e.data?.first.timings?.fajr ?? '',
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
                                      e.data?.first.timings?.fajr ?? '',
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
                                      e.data?.first.timings?.fajr ?? '',
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
                                      e.data?.first.timings?.fajr ?? '',
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
                                      e.data?.first.timings?.fajr ?? '',
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
