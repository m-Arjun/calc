import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Demo App",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String city="";
  var data=['Ruppee','dollars','euros','others','yen','new currency'];
  String currency = 'Ruppee';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo App'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(onSubmitted: (String userInput){
              setState(() {
                city=userInput;                 
              });

            },
            ),
            DropdownButton<String>(
              items: data.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
              onChanged: (String newcurrency){
                setState(() {
                  this.currency=newcurrency;
                });
              },
              value: currency,
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('the city provided is $city'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('the currency is $currency'),
            )
          ],
        ),
      ),
    );
  }
}