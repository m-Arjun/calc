import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calc",
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.white,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String city = "";
  var currency = [
    'Ruppee',
    'dollars',
    'euros',
    'others',
    'yen',
    'new currency'
  ];
  String newcurrency = 'Ruppee';
  TextStyle tx = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  String result = "";

  TextEditingController princi = TextEditingController();
  TextEditingController roi = TextEditingController();
  TextEditingController term = TextEditingController();

  var _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calc'),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: ListView(
          children: <Widget>[
            Image(
                image: AssetImage('assets/images/cur.PNG'),
                height: 150,
                width: 200),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 15),
              child: TextFormField(
                style: tx,
                keyboardType: TextInputType.number,
                controller: princi,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter the prinicple vlaue';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Principle',
                    hintText: 'Enter principle eg.12000',
                    labelStyle: tx,
                    errorStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 15),
              child: TextFormField(
                style: tx,
                keyboardType: TextInputType.number,
                controller: roi,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Enter the ROI value";
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Interest',
                    hintText: 'Enter Interest eg.12',
                    labelStyle: tx,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      style: tx,
                      controller: term,
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Enter the term value";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'Enter term',
                          labelStyle: tx,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      items: currency
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (String value) {
                        setState(() {
                          this.newcurrency = value;
                        });
                      },
                      value: newcurrency,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        setState(() {
                          if (_key.currentState.validate()) {
                            result = caluclate();
                          }
                        });
                      },
                      textColor: Theme.of(context).accentColor,
                      child: Text('Calculate'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        reset();
                      });
                    },
                    child: Text('Reset'),
                    color: Colors.lightBlue,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(result),
            )
          ],
        ),
      ),
    );
  }

  String caluclate() {
    double p = double.parse(princi.text);
    double r = double.parse(roi.text);
    double n = double.parse(term.text);

    double si = p + (p * n * r) / 100;

    return "the ttal amount is $si";
  }

  void reset() {
    princi.text = "";
    roi.text = "";
    term.text = "";
    newcurrency = currency[0];
    result = "";
  }
}
