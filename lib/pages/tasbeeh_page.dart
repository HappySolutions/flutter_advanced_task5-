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
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('سبحان الله والحمد لله ولا إله إلا الله والله أكبر'),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                builder: (context, value, _) {
                  return Text('$value');
                },
                valueListenable: counterNotifier,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterNotifier.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
