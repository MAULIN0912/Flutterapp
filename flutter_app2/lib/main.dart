import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CrudExample();
  }
}

class CrudExample extends State<MyApp> {
  get data => null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: "My App",
      debugShowCheckedModeBanner: false,
      home: new Scaffold(backgroundColor: Colors.lightBlueAccent,
        appBar: new AppBar(title: Text("Fire Fiest"),
          backgroundColor: Colors.lightBlue,),
        drawer: Drawer(),
        body: Padding(padding: const EdgeInsets.all(20.0),
          child: new Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                // ignore: argument_type_not_assignable
                new RaisedButton(onPressed: _add,
                  child: Text("ADD"),
                  // ignore: undefined_getter
                  color: Colors.amberAccent,),

                new Padding(padding: const EdgeInsets.all(10.0)),
                new RaisedButton(onPressed: _update,
                  child: Text("UPDATE"),
                  color: Colors.amberAccent,),

                new Padding(padding: const EdgeInsets.all(10.0)),
                new RaisedButton(onPressed: _delete,
                  child: Text("DELETE"),
                  color: Colors.amberAccent,),

                new Padding(padding: const EdgeInsets.all(10.0)),
                new RaisedButton(onPressed: _fetch,
                    child: Text("FETCH"),
                    color: Colors.amberAccent),

              ]),),),);
  }



  void _delete() {}
  void _fetch() {}
  void _update() {}
  void _add() {
    Map<String, String>data =
    <String, String>{"Name": "Maulin", "City": "Vadodara"};
    DocumentReference documentRefence = Firestore.instance.collection("users")
        .document("info");
    var catchError = documentRefence.setData(data).whenComplete(() {
      print("data inserted");
    }).catchError((e) => print(e));
  }

}