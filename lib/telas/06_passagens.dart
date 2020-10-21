import 'package:flutter/material.dart';
import '../widgets.dart';

class Passagens extends StatefulWidget {
  @override
  _PassagensState createState() => _PassagensState();
}

class _PassagensState extends State<Passagens> {

  var txtEmpresa;
  var txtTipo;
  var txtTrecho;
  var txtData;
  var txtHorario;
  var txtPreco;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Passagens'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                VlrUser(
                  rotulo: 'Empresa',
                  ajuste: (value){
                    setState((){
                      txtEmpresa = value.toString();                      
                    });
                  }
                ),
                VlrUser(
                  rotulo: 'Tipo',
                  ajuste: (value){
                    setState((){
                      txtTipo = value.toString();                      
                    });
                  }
                ),
                VlrUser(
                  rotulo: 'Trecho',
                  ajuste: (value){
                    setState((){
                      txtTrecho = value.toString();                      
                    });
                  }
                ),
                VlrUser(
                  rotulo: 'Data',
                  ajuste: (value){
                    setState((){
                      txtData = value.toString();                      
                    });
                  }
                ),
                VlrUser(
                  rotulo: 'Horário',
                  ajuste: (value){
                    setState((){
                      txtHorario = value.toString();                      
                    });
                  }
                ),
                VlrUser(
                  rotulo: 'Preço',
                  ajuste: (value){
                    setState((){
                      txtPreco = value.toString();                      
                    });
                  }
                ),

                RaisedButton(
                  child: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: (){ 
                    var dados = Map();
                    dados['Empresa'] = txtEmpresa;
                    dados['Tipo'] = txtTipo;
                    dados['Trecho'] = txtTrecho;
                    dados['Data'] = txtData;
                    dados['Horário'] = txtHorario;
                    dados['Preço'] = txtPreco;
                    Navigator.pushNamed(context, '/tela7', arguments: dados);          
                  }, 
                ),
                //BtnSecundario('Consultar Passagens Cadastradas', '/tela7'),
              ],
            ),
          ),
        ),
      ),      
    );
  }
}