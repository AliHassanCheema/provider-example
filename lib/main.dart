import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MaterialApp(
    title: 'Provider',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    home:  MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final contoller = MyAppController();
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) {
            return contoller;
          },
      child: Consumer<MyAppController> (
        builder: (context, value, child) {
          return Scaffold(
          appBar: AppBar(title: const Text('Provider Example')),
          body: Center(
            child: Text(contoller.name)
          ),
          floatingActionButton:  FloatingActionButton(onPressed: () {
           contoller.isChecked ? contoller.onIncrement() : contoller.onChange();
          },
          child:  Consumer (
            builder: (context, value, child) {
              return Icon(contoller.isChecked ? Icons.add : Icons.change_circle);
            },),));
       
        }, ),
    );
  }
  }

class MyAppController extends ChangeNotifier{

  String name = 'Checking';
  bool isChecked = false;
  int i = 0;

  onChange(){
     isChecked = true;
     name = ' Ali Hassan';
     notifyListeners();
  }
  onIncrement(){
     name = ' Ali Hassan  ${i++}';
     notifyListeners();
  }

}

