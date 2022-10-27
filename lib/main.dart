import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/other_kind_of_provider/state_provider.dart';

//Todo-> Riverpod Provider Syntax and Use
//final nameProvider=Provider<String>((ref){return "Hello There";})

/// nameProvider-> Is used to read the state of the provider
/// Provider<String>-> Specified we are holding String type Provider
/// ref->Ref parameter is used to read other providers
/// Riverpod provider is used when the state of the object doesn't change


final nameProvider=Provider<String>(((ref){
  return "Hello Rifat";
}));

void main() {
  //Provider Scope actually stores all the state of the provider which will create in our App
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const CounterApp(),
    );
  }
}



class MyHomePageState extends ConsumerWidget {


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final name=ref.watch(nameProvider);

    //ref.watch is used to get the value from crated provider
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
