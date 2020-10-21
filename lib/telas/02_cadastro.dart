import 'package:flutter/material.dart';
import '../widgets.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  var txtNome = TextEditingController();
  var txtCPF = TextEditingController();
  var txtEmail = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Novo Usuário'),
      
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            campoTexto("Nome",txtNome),
            campoTexto("CPF",txtCPF),
            campoTexto("E-mail",txtEmail),
            campoTexto("Telefone",txtTelefone),
            campoTexto("Senha",txtSenha),
            BtnPrincipal('Salvar', '/tela1'),
          ],)
        ),
      ),
      
    );
  }
}