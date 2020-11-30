import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class Hospedagem extends StatefulWidget {
  @override
  _HospedagemState createState() => _HospedagemState();
}

class _HospedagemState extends State<Hospedagem> {

  //Instanciar Firebase
  var db = FirebaseFirestore.instance;

  var txtHotel = TextEditingController();
  var txtLocal = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCheckin = TextEditingController();
  var txtCheckout = TextEditingController();
  var txtPreco = TextEditingController();

  //Recuperar um DOCUMENTO a partir do ID
  void getDocumentById(String id) async{
    await db.collection('hospedagem').doc(id).get()
      .then((doc) {

        txtHotel.text = doc.data()['hotel'];
        txtLocal.text = doc.data()['end'];
        txtTelefone.text = doc.data()['tel'];
        txtCheckin.text = doc.data()['checkin'];
        txtCheckout.text = doc.data()['checkout'];
        txtPreco.text = doc.data()['preco'];

      });
  }


  @override
  Widget build(BuildContext context) {

    //Se for alteração, recuperar o ID
    final String id = ModalRoute.of(context).settings.arguments;

    if (id != null){
      if (txtHotel.text == '' && txtLocal.text == '' && txtTelefone.text == '' && txtCheckin.text == '' && txtCheckout.text == '' && txtPreco.text == ''){
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: MyAppBar('Hospedagem'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [

                TxtEntrada(rotulo: 'Hotel', controle: txtHotel),
                TxtEntrada(rotulo: 'Endereço', controle: txtLocal),
                TxtEntrada(rotulo: 'Telefone', controle: txtTelefone),
                TxtEntrada(rotulo: 'Check-in', controle: txtCheckin),
                TxtEntrada(rotulo: 'Check-out', controle: txtCheckout),
                TxtEntrada(rotulo: 'Preço', controle: txtPreco),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Botao(
                      rotulo: 'Cancelar',
                      acao: (){
                        Navigator.pop(context);
                      }
                    ),
                    Botao(
                      rotulo: 'Adicionar',
                      acao: ()async{

                        if (id == null){
                          //Adicionar os dados na coleção 'destinos'
                          await db.collection("hospedagem").add(
                            {
                              "hotel" : txtHotel.text,
                              "end" : txtLocal.text,
                              "tel" : txtTelefone.text,
                              "checkin" : txtCheckin.text,
                              "checkout" : txtCheckout.text,
                              "preco" : txtPreco.text,
                            }
                          );
                        } else{
                          //Atualizar os dados da coleção 'destinos'
                          await db.collection("hospedagem").doc(id).update(
                            {
                              "hotel" : txtHotel.text,
                              "end" : txtLocal.text,
                              "tel" : txtTelefone.text,
                              "checkin" : txtCheckin.text,
                              "checkout" : txtCheckout.text,
                              "preco" : txtPreco.text,
                            }
                          );
                        }
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),  
              ],
            ),
          ),
        ),
      ),      
    );
  }
}