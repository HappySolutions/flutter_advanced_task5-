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
  List<Map<String, dynamic>> prayerTims = [];
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
          title: const Text('مواعيد الصلاة'),
        ),
        body: isLoading
            ? const CircularProgressIndicator()
            : ListView(
                children: prayerTims
                    .map(
                      (e) => ListTile(
                        title: const Text(
                          'صلاة الفجر',
                        ),
                        subtitle: Text(
                          e['Fajr'],
                        ),
                      ),
                    )
                    .toList(),
              ));
  }
}
