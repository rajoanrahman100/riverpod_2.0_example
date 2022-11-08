import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers_classifications/FutureProvider/api_service.dart';

import '../../model/user__data_model.dart';

final apiProvider = Provider<ApiService>(
  (ref) {
    return ApiService();
  },
);

final futureProvider = FutureProvider<List<Data>>(
  (ref) {
    return ref.read(apiProvider).getUser();
  },
);

class UserDataClass extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    var userData = ref.watch(futureProvider);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: userData.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return Text("First Name :${data[index].firstName}");
                },
              );
            },
            error: (_, context) => const Text("Some Error"),
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
