// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:carousel_slider_app/components/neu_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrayerListPage extends StatefulWidget {
  const PrayerListPage({super.key});

  @override
  State<PrayerListPage> createState() => _PrayerListPageState();
}

class _PrayerListPageState extends State<PrayerListPage> {
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
      prayerTims = response['data'];
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
            ? const Center(child: CircularProgressIndicator())
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
                                      '${e['timings']['Fajr']} AM',
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
                                      '${e['timings']['Sunrise']} AM',
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
                                      '${e['timings']['Dhuhr']} PM',
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
                                      '${e['timings']['Asr']} PM',
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
                                      '${e['timings']['Maghrib']} PM',
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
                                      '${e['timings']['Isha']} PM',
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
                                      '${e['timings']['Midnight']} AM',
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
