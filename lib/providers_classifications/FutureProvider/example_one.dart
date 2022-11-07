import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_demo/model/cat_facts_model_class.dart';

final futureProvider = FutureProvider(
  (ref) async {
    final catFacts = await get(Uri.parse("https://catfact.ninja/facts"));
    return catFacts;
  },
);

class FutureProviderExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final futureCatRef = ref.watch(futureProvider);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: futureCatRef.when(
            data: (response){
              final decodeData=json.decode(response.body);
              CatFactsModel catFactsModel=CatFactsModel.fromJson(decodeData);
              
              return ListView.builder(
                itemCount: catFactsModel.data!.length,
                itemBuilder: (_,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(catFactsModel.data![index].fact),
                  );
                },
              );
            },
            error: (_, context) => const Text("Some Error"),
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
