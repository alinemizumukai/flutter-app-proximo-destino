import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var txtNome = TextEditingController();
  var txtCpf = TextEditingController();
  var txtEmail = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtSenha = TextEditingController();

  //Instanciar Firebase
  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar('Novo Usuário'),
      
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            TxtEntrada(
              rotulo: 'Nome Completo', 
              controle: txtNome,
              validador: (String value) {
                String patttern = r'(^[a-zA-Z ]*$)';
                RegExp regExp = new RegExp(patttern);
                if (value.length == 0) {
                  return "Informe o nome";
                } else if (!regExp.hasMatch(value)) {
                  return "O nome deve conter caracteres de a-z ou A-Z";
                }
                return null;
              },
            ),                        
            TxtEntrada(rotulo: 'CPF', controle: txtCpf),
            TxtEntrada(rotulo: 'E-mail', controle: txtEmail),
            TxtEntrada(rotulo: 'Telefone', controle: txtTelefone),
            TxtEntrada(rotulo: 'Senha', controle: txtSenha),

            Botao(
              rotulo: 'Salvar',
              acao: ()async{

                //Adicionar os dados na coleção 'usuarios'
                await db.collection("usuarios").add(
                  {
                    "nome" : txtNome.text,
                    "cpf" : txtCpf.text,
                    "email" : txtEmail.text,
                    "telefone" : txtTelefone.text,
                    "senha" : txtSenha.text,
                  }
                );

                // ignore: deprecated_member_use
                scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text('Usuário cadastrado.'),
                    duration: Duration(seconds: 2),
                  ),
                );

                Navigator.pop(context);
              },
            ),            
            ],
          ),
        ),
      ),      
    );
  }
  
}