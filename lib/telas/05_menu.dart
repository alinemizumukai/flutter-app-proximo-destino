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
              ItemPlanner('Transporte', '/tela7'),
              ItemPlanner('Hospedagem', '/tela9'),
              //ItemPlanner('Seguro Viagem', '/tela0'),              
              ItemPlanner('Documentos / Imigração', '/tela10'),            
              ItemPlanner('Lista de Bagagem - Lista', '/tela11'),
              //ItemPlanner('Roteiro', '/tela0'),
              //ItemPlanner('Compra de Moeda', '/tela0'),
              //ItemPlanner('Outras Informações', '/tela0'),
            ],
          ),        
        ),
      ),      
    );
  }
}