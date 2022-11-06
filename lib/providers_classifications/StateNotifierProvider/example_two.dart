import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNotifier extends StateNotifier<List<String>>{

  //Initialised empty list
  MyNotifier():super([]);

  void addString(String stringToAdd){
    state=[...state,stringToAdd];
  }


}

final myNotifierProvider=StateNotifierProvider<MyNotifier,List>((ref) {
  return MyNotifier();
},);

class MyNotifierExample extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    var myNotifierRef=ref.watch(myNotifierProvider);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: myNotifierRef.length,
                itemBuilder: (_,index){
                  return Text("$index ${myNotifierRef[index]}");
                },
              ),
            ),
            ElevatedButton(onPressed: (){
              ref.read(myNotifierProvider.notifier).addString("stringToAdd");
            }, child:const Text("Add String")),

          ],
        ),
      ),
    );
  }

}