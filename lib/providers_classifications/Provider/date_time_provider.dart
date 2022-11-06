import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final dateTimeProvider = Provider(
  (ref) {
    return DateFormat.yMMMMd('en_US');
  },
);

final nameTextController = Provider(
  (ref) {
    return TextEditingController();
  },
);

class DateTimeProvider extends ConsumerWidget {
  const DateTimeProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    final dateTimeValue = ref.watch(dateTimeProvider);
    final nameTextField = ref.watch(nameTextController);

    print("Widget Build");

    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Today's Date ${dateTimeValue.format(DateTime.now())}"),
          TextFormField(
            controller: nameTextField,
          ),
          ElevatedButton(
              onPressed: () {
                print(nameTextField.text);
              },
              child: const Text("Tap"))
        ],
      ),
    ));
  }
}
