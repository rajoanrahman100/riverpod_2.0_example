import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkBoxProvider=StateProvider((ref) => false,);

class ExampleTwo extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    var checkBoxRef=ref.watch(checkBoxProvider);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Checkbox(value: checkBoxRef, onChanged: (val){
                  ref.read(checkBoxProvider.notifier).state=val!;
                }),
                Text("${checkBoxRef}")
              ],
            ),

          ],
        ),
      ),
    );
  }

}