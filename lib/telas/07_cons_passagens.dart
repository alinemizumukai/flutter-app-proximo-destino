import 'dart:async';

import 'package:app_atividade_avaliativa/model/transporte.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class PlannerPassagens extends StatefulWidget {
  @override
  _PlannerPassagensState createState() => _PlannerPassagensState();
}

class _PlannerPassagensState extends State<PlannerPassagens> {

  var db = FirebaseFirestore.instance;  

  //Lista dinâmica de objetos da classe Hospedagem
  List<Transporte> passagens = List();

  //Declaração de um objeto ouvinte da coleção destinos / destino / hospedagem
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){
    super.initState();

    //Registrar o ouvidor para monitorar as alterações
    ouvidor?.cancel();

    ouvidor = db.collection("transporte").snapshots().listen((res) {
      
      setState((){
        passagens = res.docs.map((e) => Transporte.fromMap(e.data(), e.id)).toList();

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: MyAppBar('Transporte'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("transporte").snapshots(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return Center(child: Text('Erro ao conectar no Firebase'));
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());  

            default: return ListView.builder(
              itemCount: passagens.length,
              itemBuilder: (context, index){

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                  color: Colors.grey[100],            
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        
                        Text('Orçamento #${index+1}', style: TextStyle(fontSize: 18),),
                        SizedBox(height: 2.0,),
                        Text('Empresa: ${passagens[index].empresa}'),
                        SizedBox(height: 2.0,),
                        Text('Tipo de transporte: ${passagens[index].tipo}'),
                        SizedBox(height: 2.0,),
                        Text('Trecho: ${passagens[index].trecho}'),
                        SizedBox(height: 2.0,),
                        Text('Data: ${passagens[index].data}'),
                        SizedBox(height: 2.0,),
                        Text('Horário: ${passagens[index].hora}'),
                        SizedBox(height: 2.0,),
                        Text('Preço: ${passagens[index].preco}'),
                                 
                        ButtonBar(
                            children: <Widget>[
                              //PARA ANEXAR UM ARQUIVO
                              FlatButton(
                                child: Text('ANEXO'),                    
                                onPressed: null,                                
                              ),
                              //PARA ALTERAR ALGUMA INFORMAÇÃO DESTA TELA (passa ID como parametro)
                              FlatButton(
                                child: Text('ALTERAR'),
                                onPressed: (){
                                  Navigator.pushNamed(context, '/tela6', arguments: passagens[index].id);
                                },
                              ),
                              //PARA DELETAR UM DESTINO CADASTRADO
                              FlatButton(
                                child: Text('EXCLUIR'),
                                onPressed: (){
                                  setState((){
                                    //Apagar o documento
                                    db.collection("transporte").doc(passagens[index].id).delete();
                                   
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
        dica: 'Novo orçamento',
        acao: (){
          Navigator.pushNamed(context, '/tela6');
        }
        )

    );
  }
}