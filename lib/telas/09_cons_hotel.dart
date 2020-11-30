import 'dart:async';

import 'package:app_atividade_avaliativa/model/hospedagem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class PlannerHospedagem extends StatefulWidget {
  @override
  _PlannerHospedagemState createState() => _PlannerHospedagemState();
}

class _PlannerHospedagemState extends State<PlannerHospedagem> {

  var db = FirebaseFirestore.instance;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  //Lista dinâmica de objetos da classe Hospedagem
  List<Hospedagem> hospedagens = List();

  //Declaração de um objeto ouvinte da coleção destinos / destino / hospedagem
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){
    super.initState();

    //Registrar o ouvidor para monitorar as alterações
    ouvidor?.cancel();

    ouvidor = db.collection("hospedagem").snapshots().listen((res) {

      setState((){
        hospedagens = res.docs.map((e) => Hospedagem.fromMap(e.data(), e.id)).toList();

      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar('Hospedagem'),
      backgroundColor: Theme.of(context).backgroundColor,

      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("hospedagem").snapshots(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return Center(child: Text('Erro ao conectar no Firebase'));
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());  

            default: return ListView.builder(
              itemCount: hospedagens.length,
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
                        Text('Hotel: ${hospedagens[index].hotel}'),
                        SizedBox(height: 2.0,),
                        Text('End: ${hospedagens[index].end}'),
                        SizedBox(height: 2.0,),
                        Text('Telefone: ${hospedagens[index].tel}'),
                        SizedBox(height: 2.0,),
                        Text('Check-in: ${hospedagens[index].checkin}'),
                        SizedBox(height: 2.0,),
                        Text('Check-out: ${hospedagens[index].checkout}'),
                        SizedBox(height: 2.0,),
                        Text('Preço: ${hospedagens[index].preco}'),
                                 
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
                                  Navigator.pushNamed(context, '/tela8', arguments: hospedagens[index].id);
                                },
                              ),
                              //PARA DELETAR UM DESTINO CADASTRADO
                              FlatButton(
                                child: Text('EXCLUIR'),
                                onPressed: (){
                                  setState((){
                                    //Apagar o documento
                                    db.collection("hospedagem").doc(hospedagens[index].id).delete();

                                    //Informar que a ação foi executada
                                    // ignore: deprecated_member_use
                                    scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text('Orçamento removido.'),
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
        dica: 'Novo orçamento',
        acao: (){
          Navigator.pushNamed(context, '/tela8');
        }
        )
    );
     
    
  }
}