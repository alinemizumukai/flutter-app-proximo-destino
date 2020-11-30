import 'package:flutter/material.dart';

//
// APP BAR
//

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  final String titulo;

  MyAppBar(this.titulo): super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
    title: Text(
      titulo,       
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,        
        ),
      ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.info_outline, size: 34,),
        tooltip: 'Sobre o aplicativo',
        onPressed: (){
          Navigator.pushNamed(context, '/tela99');
        },
      ),
    ],
  );
  }
}

//
// ENTRADA DE DADOS - PADRÃO
//

// ignore: must_be_immutable
class TxtEntrada extends StatelessWidget {

  final String rotulo;
  var controle;
  final Function validador;

  TxtEntrada({this.rotulo, this.controle, this.validador}):super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextFormField(
      controller: controle,
      style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(fontSize: 18), 
        ),  
      validator: validador, 
      ),
    );
  }
  
}


//
// BOTÃO - PADRÃO
//

class Botao extends StatelessWidget {

  final String rotulo;
  final Function acao;

  Botao({this.rotulo, this.acao}): super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: RaisedButton(
      child: Text(
        rotulo,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      color: Theme.of(context).primaryColor,
      onPressed: acao,
    ),
    );
  }
}

//
// BOTÃO ADICIONAR
//

class BotaoAdd extends StatelessWidget {
  final String dica;
  final Function acao;

  BotaoAdd({this.dica, this.acao}): super();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      tooltip: dica,
      onPressed: acao,       
    );
  }
}


//
// PLANNER
//

class ItemPlanner extends StatelessWidget {

  final String rotulo;
  final String tela;

  ItemPlanner(this.rotulo, this.tela):super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(rotulo),
      onTap: (){
        Navigator.pushNamed(context, tela);
      },
      
    );
  }
}