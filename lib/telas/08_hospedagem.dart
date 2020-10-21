import 'package:flutter/material.dart';
import '../widgets.dart';

class Hospedagem extends StatefulWidget {
  @override
  _HospedagemState createState() => _HospedagemState();
}

class _HospedagemState extends State<Hospedagem> {

  var txtHotel;
  var txtLocal;
  var txtTelefone;
  var txtCheckin;
  var txtCheckout;
  var txtPreco;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Hospedagem'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                VlrUser(
                  rotulo: 'Hotel',
                  ajuste: (value){
                    setState((){
                      txtHotel = value.toString();                      
                    });
                  }
                ),
                VlrUser(
                  rotulo: 'Local',
                  ajuste: (value){
                    setState((){
                      txtLocal = value.toString();                      
                    });
                  }
                ),
                VlrUser(
                  rotulo: 'Telefone',
                  ajuste: (value){
                    setState((){
                      txtTelefone = value.toString();                      
                    });
                  }
                ),
                VlrUser(
                  rotulo: 'Check-in',
                  ajuste: (value){
                    setState((){
                      txtCheckin = value.toString();                      
                    });
                  }
                ),
                VlrUser(
                  rotulo: 'Check-out',
                  ajuste: (value){
                    setState((){
                      txtCheckout = value.toString();                      
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
                    var dadosHotel = Map();
                    dadosHotel['Hotel'] = txtHotel;
                    dadosHotel['Local'] = txtLocal;
                    dadosHotel['Telefone'] = txtTelefone;
                    dadosHotel['Checkin'] = txtCheckin;
                    dadosHotel['Checkout'] = txtCheckout;
                    dadosHotel['Preco'] = txtPreco;
                    Navigator.pushNamed(context, '/tela9', arguments: dadosHotel);          
                  }, 
                ),
                //BtnSecundario('Consultar Hospedagens Cadastradas', '/tela9'),
              ],
            ),
          ),
        ),
      ),      
    );
  }
}