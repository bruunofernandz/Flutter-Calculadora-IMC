import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _infoText = "Informe seus Dados";

  void _resetField() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus Dados";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double result = weight / (height * height);

      print(result);

      if (result < 18.6) {
        _infoText = "Abaixo do Peso (${result.toStringAsPrecision(3)})";
      } else if (result >= 18.6 && result <= 24.9) {
        _infoText = "Peso ideal (${result.toStringAsPrecision(3)})";
      } else if (result >= 24.9 && result <= 29.9) {
        _infoText =
            "Levemente acima do peso (${result.toStringAsPrecision(3)})";
      } else if (result >= 29.9 && result <= 34.9) {
        _infoText = "Obesidade Grau I (${result.toStringAsPrecision(3)})";
      } else if (result >= 34.9 && result <= 39.9) {
        _infoText = "Obesidade Grau II (${result.toStringAsPrecision(3)})";
      } else if (result >= 40) {
        _infoText = "Obesidade Grau II (${result.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetField,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 120,
                      color: Colors.red[900],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Insira seu peso";
                          }
                        },
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Peso em Kilograma",
                          labelStyle: TextStyle(color: Colors.orange[900]),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red[900], fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Insira seu sua altura";
                          }
                        },
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Altura em Centímetros",
                          labelStyle: TextStyle(color: Colors.orange[900]),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red[900], fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _calculate();
                          }
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.red[900],
                      ),
                    ),
                    Text(
                      _infoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.orange[900]),
                    )
                  ],
                ),
              ))),
    );
  }
}
