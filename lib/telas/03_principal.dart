import 'dart:async';

import 'package:app_atividade_avaliativa/model/destinos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class MenuInicial extends StatefulWidget {
  @override
  _MenuInicialState createState() => _MenuInicialState();
}

class _MenuInicialState extends State<MenuInicial> {

  var db = FirebaseFirestore.instance;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  //Lista dinâmica de objetos da classe Destino
  List<Destino> destinos = List();

  //Declaração de um objeto ouvinte da coleção destinos
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){
    super.initState();

    //Registrar o ouvidor para monitorar as alterações
    ouvidor?.cancel();

    ouvidor = db.collection("destinos").snapshots().listen((res) {

      setState((){
        destinos = res.docs.map((e) => Destino.fromMap(e.data(), e.id)).toList();

      });
    });

  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar('Meus Destinos'),
      backgroundColor: Theme.of(context).backgroundColor,

      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("destinos").snapshots(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return Center(child: Text('Erro ao conectar no Firebase'));
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());  

            default: return ListView.builder(
              itemCount: destinos.length,
              itemBuilder: (context, index){

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                  color: Colors.grey[100],            
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          destinos[index].destino,
                          style: TextStyle(
                            fontSize: 30.0,              
                          ),
                        ),
                        SizedBox(height: 2.0,),
                        Text(
                          'De: ${destinos[index].ida}',
                          style: TextStyle(
                            fontSize: 16.0,              
                          ),
                        ),
                        SizedBox(height: 2.0,),
                        Text(
                          'Até: ${destinos[index].volta}',
                          style: TextStyle(
                            fontSize: 16.0,              
                          ),
                        ),
                                  
                        ButtonBar(
                            children: <Widget>[
                              //PARA ACESSAR MAIS OPÇÕES
                              FlatButton(
                                child: Text('DETALHES'),                    
                                onPressed: (){
                                  Navigator.pushNamed(context, '/tela5', arguments: destinos[index].destino);
                                },                                
                              ),
                              //PARA ALTERAR ALGUMA INFORMAÇÃO DESTA TELA (passa ID como parametro)
                              FlatButton(
                                child: Text('ALTERAR'),
                                onPressed: (){
                                  Navigator.pushNamed(context, '/tela4', arguments: destinos[index].id);
                                },
                              ),
                              //PARA DELETAR UM DESTINO CADASTRADO
                              FlatButton(
                                child: Text('EXCLUIR'),
                                onPressed: (){
                                  setState((){
                                    //Apagar o documento
                                    db.collection("destinos").doc(destinos[index].id).delete();

                                    //Informar que a ação foi executada
                                    // ignore: deprecated_member_use
                                    scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text('Destino removido.'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );  
                                  });
                                },         
                                
                              ),
                            ],            
                        ),                 
                      ],
                    ),
                  ),

                  
                  
                );

              },

            );
          }
        },
        ),

      floatingActionButton: BotaoAdd(
        dica: 'Novo destino',
        acao: (){
          Navigator.pushNamed(context, '/tela4');
        }
        )
    );
  }
}