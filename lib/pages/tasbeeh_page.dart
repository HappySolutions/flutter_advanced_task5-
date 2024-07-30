import 'package:flutter/material.dart';

class TasbeehPage extends StatefulWidget {
  const TasbeehPage({super.key});

  @override
  State<TasbeehPage> createState() => _TasbeehPageState();
}

class _TasbeehPageState extends State<TasbeehPage> {
  var counterNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('عداد التسبيح'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'سبحان الله بحمده سبحان الله العظيم',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                builder: (context, value, _) {
                  return Text(
                    '$value',
                    style: const TextStyle(fontSize: 20),
                  );
                },
                valueListenable: counterNotifier,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  counterNotifier.value = 0;
                },
                child: const Text(
                  'إعادة الضبط',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none),
        backgroundColor: Colors.green,
        onPressed: () {
          counterNotifier.value++;
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
