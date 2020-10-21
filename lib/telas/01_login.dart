import 'package:flutter/material.dart';
import '../widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var txtUser = TextEditingController();
  var txtSenha = TextEditingController();
  var user = 'aline';
  var senha = '123456';
  var scaffoldKey = GlobalKey<ScaffoldState>();
      
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
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
                    campoTexto("Usuário (e-mail)", txtUser),
                    campoTexto("Senha", txtSenha),
                    RaisedButton(
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: (){   
                          
                        if((txtUser.text == user) && txtSenha.text == senha){    
                          Navigator.pushNamed(context, '/tela3');
                        }
                        else{
                          scaffoldKey.currentState.showSnackBar( 
                            SnackBar(
                              content: Text('Dados incorretos'),
                              duration: Duration(seconds: 2),  
                            ),
                          );
                        }          
                      }, 
                    ),                  
                    BtnSecundario('Cadastre-se', '/tela2'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
