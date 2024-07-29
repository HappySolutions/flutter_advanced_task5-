// ignore_for_file: avoid_print

import 'dart:convert';

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
            ? const CircularProgressIndicator()
            : ListView(
                children: prayerTims
                    .map(
                      (e) => ListTile(
                        title: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'صلاة الفجر: ',
                                ),
                                Text(
                                  e['timings']['Fajr'],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'صلاة الفجر: ',
                                ),
                                Text(
                                  e['timings']['Fajr'],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'الشروق : ',
                                ),
                                Text(
                                  e['timings']['Sunrise'],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'صلاة الظهر: ',
                                ),
                                Text(
                                  e['timings']['Dhuhr'],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'صلاة العصر: ',
                                ),
                                Text(
                                  e['timings']['Asr'],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'صلاة المغرب: ',
                                ),
                                Text(
                                  e['timings']['Maghrib'],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'صلاة العشاء: ',
                                ),
                                Text(
                                  e['timings']['Isha'],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'منتصف الليل : ',
                                ),
                                Text(
                                  e['timings']['Midnight'],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ));
  }
}
