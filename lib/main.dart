import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MaterialApp(
    title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    home:  MyApp()));
}

class MyApp extends StatelessWidget {
  var contoller = MyAppController();
  @override
  Widget build(BuildContext context) {
    debugPrint(' Build called>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    return  Scaffold(
      body: ChangeNotifierProvider(
        create: (context) {
          return contoller;
        },
        child: Center(
          child: Consumer <MyAppController> (
            builder:(context, value, child) {
              debugPrint('consumer calledd>>>>>>>>>>>>>>>');
              return Text(value.name);
            }),
        ),
      ),
      floatingActionButton:  FloatingActionButton(onPressed: () {
       contoller.onChange();
      },
      child: const Icon(Icons.change_circle),));
  }
  }

class MyAppController extends ChangeNotifier{

  String name = 'Checking';

  onChange(){
    debugPrint('onChange calledddddddddddddddddddddddddddddddd');
     name = ' Ali Hassan';
     notifyListeners();
  }

}

