import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Increment>(
      create: (BuildContext context) => Increment(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Flutter Demo App Using Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '30 Days of Code is how many times awesome?',
            ),
            Text(
              Provider.of<Increment>(context).data.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Increment>(context, listen: false).increaseNumber();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}

class Increment extends ChangeNotifier {
  int data = 0;
  void increaseNumber() {
    data++;
    notifyListeners();
  }
}
