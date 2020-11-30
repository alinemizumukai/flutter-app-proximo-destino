import 'dart:async';

import 'package:app_atividade_avaliativa/model/usuarios.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var db = FirebaseFirestore.instance;
  
  //Lista dinâmica de objetos da classe Usuario
  List<Usuario> usuarios = List();

  //Declaração de um objeto ouvinte da coleção usuarios
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){
    super.initState();

    //Registrar o ouvidor para monitorar as alterações
    ouvidor?.cancel();

    ouvidor = db.collection("usuarios").snapshots().listen((event) {

      setState((){
        usuarios = event.docs.map((e) => Usuario.fromMap(e.data(), e.id)).toList();

      });
    });

  }

  var txtUser = TextEditingController();
  var txtSenha = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
      
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("usuarios").snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){

            case ConnectionState.none:
              return Center (child: Text("Erro ao conectar ao Firebase"),);
            case ConnectionState.waiting:
              return Center (child: CircularProgressIndicator());
            default: return SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(40),            
                    //margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,              
                      children: [                  
                          Image.asset('imagens/logotipo.png', scale: 0.8,),

                          TxtEntrada(rotulo: "E-mail", controle: txtUser),
                          TxtEntrada(rotulo: "Senha", controle: txtSenha,),

                          Botao(
                            rotulo: 'Entrar',
                            acao: (){
                              db.collection("usuarios").where("email", isEqualTo: txtUser.text )
                              .get()
                              .then((usuarios){                              
                                if((usuarios.size > 0) && txtSenha.text == usuarios.docs.elementAt(0).data()['senha'].toString() ){    
                                  Navigator.pushNamed(context, '/tela3');
                                }
                                else{
                                  // ignore: deprecated_member_use
                                  scaffoldKey.currentState.showSnackBar( 
                                    SnackBar(
                                      content: Text('Dados incorretos'),
                                      duration: Duration(seconds: 2),  
                                    ),
                                  );
                                }
                              });          
                            },
                          ),

                          Botao(
                            rotulo: 'Cadastre-se',
                            acao: (){
                              Navigator.pushNamed(context, '/tela2');
                            }
                          )
                      ],
                    ),
                  ),
                ),
              ),
            );          
          }
        },
      ),
    );
  }
}
