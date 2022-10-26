import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/main.dart';

class UsingWidgetRe extends ConsumerWidget {
  const UsingWidgetRe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final name=ref.watch(nameProvider);
    //ref.watch is used to get the value from crated provider

    return Scaffold(

    );
  }
}
