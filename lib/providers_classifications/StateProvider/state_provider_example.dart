

//StateProvider is great for storing simple state objects that can change,

/*
1. The state of a StateProvider is typically one of:

-> an enum, such as a filter type
-> a String, typically the raw content of a text field
-> a boolean, for checkboxes
-> a number, for pagination or age form fields

2. You should not use StateProvider if:

-> your state needs validation logic
-> your state is a complex object (such as a custom class, a list/map, ...)
-> the logic for modifying your state is more advanced than a simple count++.*/


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider=StateProvider((ref) {
  return "Rifat";
},);

final nmyNameController = Provider(
      (ref) {
    return TextEditingController();
  },
);

class StateProviderExample extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final nameRef=ref.watch(nameProvider);
    final nameControllerRef = ref.watch(nmyNameController);

    return Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("My Name $nameRef"),
              TextFormField(
                controller: nameControllerRef,
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(nameProvider.notifier).state=nameControllerRef.text;
                   // print(nameTextField.text);
                  },
                  child: const Text("Chane Name"))
            ],
          ),
        ));
  }

}
