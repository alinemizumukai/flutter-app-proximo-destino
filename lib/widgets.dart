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
        icon: Icon(Icons.info_outline, size: 32,),
        tooltip: 'Sobre o aplicativo',
        onPressed: (){
          Navigator.pushNamed(context, '/tela4');
        },
      ),
    ],
  );
  }
}

//
// CAMPO DE TEXTO
//

Widget campoTexto(rotulo, variavelControle){  
  return Container(
    padding: EdgeInsets.all(5),
    child: TextFormField(
      controller: variavelControle,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 18), 
      ),      
    ),
  );
}

//
// ENTRADA DE DADOS
//

class VlrUser extends StatelessWidget {

  final String rotulo;
  final Function ajuste;
  
  VlrUser({this.rotulo, this.ajuste}): super();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: rotulo
      ),
      onChanged: ajuste,
  );
  }
}

//
// BOTÃO PRINCIPAL
//

class BtnPrincipal extends StatelessWidget {

  final String rotulo;
  final String tela;

  BtnPrincipal(this.rotulo, this.tela): super();

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
      onPressed: (){         
        Navigator.pushNamed(context, tela);          
      }, 
    ),
  );
  }
}

//
// BOTÃO SECUNDÁRIO
//

class BtnSecundario extends StatelessWidget {

  final String rotulo;
  final String tela;

  BtnSecundario(this.rotulo, this.tela): super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
    child: FlatButton(
      child: Text(
        rotulo,
        style: TextStyle(color: Colors.grey[600], fontSize: 18),
      ),      
      color: Theme.of(context).backgroundColor,
      onPressed: (){ 
        Navigator.pushNamed(context, tela);          
      }, 
    ),
    );
  }
}

//
//CARTÃO - MENU PRINCIPAL
//

class Destino extends StatelessWidget {

  final String destino;
  final Function delete;
  
  Destino({this.destino, this.delete}): super(); 

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
      color: Colors.grey[100],            
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              destino,
              style: TextStyle(
                fontSize: 30.0,              
              ),
            ),
            SizedBox(height: 2.0,),
            Text(
              'xx/xx/xxxx',
              style: TextStyle(
                fontSize: 16.0,              
              ),
            ),
            SizedBox(height: 2.0,),
            Text(
              '0,00',
              style: TextStyle(
                fontSize: 16.0,              
              ),
            ),          
            ButtonBar(
                children: <Widget>[
                  FlatButton(                    
                    onPressed: (){
                      Navigator.pushNamed(context, '/tela5', arguments: destino);
                    },
                    child: Text('DETALHES'),
                  ),
                  FlatButton(
                    onPressed: delete,                    
                    child: Text('EXCLUIR'),
                  ),
                ],            
            ),                 
          ],
        ),
      )      
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