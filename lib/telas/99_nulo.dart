import 'package:app_atividade_avaliativa/widgets.dart';
import 'package:flutter/material.dart';

class EmConstrucao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Desculpe'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Text('Página em construção',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 50.0),),
      ),
    );
  }
}