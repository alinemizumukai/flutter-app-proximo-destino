import 'package:flutter/material.dart';
import '../widgets.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {  

  var scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    var texto = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: MyAppBar(texto),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Center(
          child: ListView(            
            children: [
              ItemPlanner('Passagens', '/tela6'),
              ItemPlanner('Hospedagens', '/tela8'),
              ItemPlanner('Seguro Viagem', '/tela99'),
              ItemPlanner('Imigração - Documentos', '/tela10'),
              ItemPlanner('Bagagem - Lista', '/tela11'),
              //ItemPlanner('Roteiros', '/tela99'),
              //ItemPlanner('Compra de Moeda', '/tela99'),
              //ItemPlanner('Utilidades Gerais', '/tela99'),
            ],
          ),        
        ),
      ),      
    );
  }
}