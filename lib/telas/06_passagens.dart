import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class Passagens extends StatefulWidget {
  @override
  _PassagensState createState() => _PassagensState();
}

class _PassagensState extends State<Passagens> {


  //Instanciar Firebase
  var db = FirebaseFirestore.instance;

  var txtEmpresa = TextEditingController();
  var txtTipo = TextEditingController();
  var txtTrecho = TextEditingController();
  var txtData = TextEditingController();
  var txtHorario = TextEditingController();
  var txtPreco = TextEditingController();

  //Recuperar um DOCUMENTO a partir do ID
  void getDocumentById(String id) async{
    await db.collection('transporte').doc(id).get()
      .then((doc) {

        txtEmpresa.text = doc.data()['empresa'];
        txtTipo.text = doc.data()['tipo'];
        txtTrecho.text = doc.data()['trecho'];
        txtData.text = doc.data()['data'];
        txtHorario.text = doc.data()['hora'];
        txtPreco.text = doc.data()['preco'];

      });
  }
  

  @override
  Widget build(BuildContext context) {
    //Se for alteração, recuperar o ID
    final String id = ModalRoute.of(context).settings.arguments;

    if (id != null){
      if (txtEmpresa.text == '' && txtTipo.text == '' && txtTrecho.text == '' && txtData.text == '' && txtHorario.text == '' && txtPreco.text == ''){
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: MyAppBar('Transporte'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                
                TxtEntrada(rotulo: 'Empresa', controle: txtEmpresa),
                TxtEntrada(rotulo: 'Tipo de transporte', controle: txtTipo),
                TxtEntrada(rotulo: 'Trecho', controle: txtTrecho),
                TxtEntrada(rotulo: 'Data', controle: txtData),
                TxtEntrada(rotulo: 'Horário', controle: txtHorario),
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
                          await db.collection("transporte").add(
                            {
                              "empresa" : txtEmpresa.text,
                              "tipo" : txtTipo.text,
                              "trecho" : txtTrecho.text,
                              "data" : txtData.text,
                              "hora" : txtHorario.text,
                              "preco" : txtPreco.text,
                            }
                          );
                        } else{
                          //Atualizar os dados da coleção 'destinos'
                          await db.collection("transporte").doc(id).update(
                            {
                              "empresa" : txtEmpresa.text,
                              "tipo" : txtTipo.text,
                              "trecho" : txtTrecho.text,
                              "data" : txtData.text,
                              "hora" : txtHorario.text,
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