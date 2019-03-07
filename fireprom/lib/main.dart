import 'package:flutter/material.dart';

void main() => runApp(new MyApp(

));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Calculator',
      theme: new ThemeData(primarySwatch: Colors.orange,),
      home: new MyHomePage(title: 'Calculator'),);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String out= "0";
  String _out="0";
  double num1=0.0;
  double num2=0.0;
  String operand ="";


  get radians => null;

  buttonPressed(String buttonText){
    if(buttonText=="CE"){
      _out="0";
      double num1=0.0;
      double num2=0.0;
      operand ="";
      }
      else if (buttonText =="+"||buttonText == "-"||buttonText == "*"||buttonText == "/"||buttonText=="%"){
      num1=double.parse(out);
      operand=buttonText;
      _out="0";

    }
    else if(buttonText=="."){
      if(_out.contains(".")){
        print("ERROR");
        return;
      }else{
        _out=_out+buttonText;
      }
    }
    else if(buttonText == "="){
      num2=double.parse(out);
      if(operand=="+"){
        _out=(num1+num2).toString();
      }
      if(operand=="-"){
        _out=(num1-num2).toString();
      }
      if(operand=="*"){
        _out=(num1*num2).toString();
      }
      if(operand=="/"){
        _out=(num1/num2).toString();
      }
      if(operand=="%"){
        _out=(num1%num2).toString();
      }
      num1=0.0;
      num2=0.0;
      operand="";
    }
    else {
      _out=_out+buttonText;
    }

    print(_out);
    setState(() {
      out=double.parse(_out).toStringAsFixed(2);
    });
  }
  Widget buildButton(String buttonText){
    return new Expanded(

      child: new RaisedButton(

        color: Colors.lightBlueAccent,
        textColor: Colors.white,
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
        ),

        onPressed: () => buttonPressed(buttonText),

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text(widget.title),),
      body: new Container(child: new Column(children: <Widget>[
        new Container(
          alignment: Alignment.centerRight,
          padding: new EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 12.0
      ),
            child: new Text(out,style: new TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ))),

        new Expanded(
            child: new Divider()
        ),

        new Column(children:[
          new Row(children:[
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("/")
          ]),
          new Row(children:[
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton("*")
          ]),
          new Row(children:[
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton("+")
          ]),
          new Row(children:[
            buildButton("."),
            buildButton("0"),
            buildButton("%"),
            buildButton("-")
          ]),
          new Row(children:[
            buildButton("CE"),
            buildButton("=")
          ])
        ])
    ],
    )));
  }
}
