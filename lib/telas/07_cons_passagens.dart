import 'package:flutter/material.dart';
import '../widgets.dart';

class PlannerPassagens extends StatefulWidget {
  @override
  _PlannerPassagensState createState() => _PlannerPassagensState();
}

class _PlannerPassagensState extends State<PlannerPassagens> {

  @override
  Widget build(BuildContext context) {
    Map dados = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: MyAppBar('Passagens'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              color: Colors.grey[100],   
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Orçamento #1', style: TextStyle(fontSize: 18),),
                    Text('Empresa: ${dados['Empresa']}'),
                    Text('Tipo: ${dados['Tipo']}'),
                    Text('Trecho: ${dados['Trecho']}'),
                    Text('Data: ${dados['Data']}'),
                    Text('Horário: ${dados['Horário']}'),
                    Text('Preço: ${dados['Preço']}'),
                  ]
                ),
              ),
            ),
          ],
        ),

      ),

      
    );
  }
}