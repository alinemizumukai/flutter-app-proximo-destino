import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class CadastroGeral extends StatefulWidget {
  @override
  _CadastroGeralState createState() => _CadastroGeralState();
}

class _CadastroGeralState extends State<CadastroGeral> {

  //Instanciar Firebase
  var db = FirebaseFirestore.instance;

  var txtDestino = TextEditingController();
  var txtIda = TextEditingController();
  var txtVolta = TextEditingController();

  //Recuperar um DOCUMENTO a partir do ID
  void getDocumentById(String id) async{
    await db.collection('destinos').doc(id).get()
      .then((doc) {

        txtDestino.text = doc.data()['destino'];
        txtIda.text = doc.data()['ida'];
        txtVolta.text = doc.data()['volta'];

      });
  }

  @override
  Widget build(BuildContext context) {

    //Se for alteração, recuperar o ID
    final String id = ModalRoute.of(context).settings.arguments;

    if (id != null){
      if (txtDestino.text == '' && txtIda.text == '' && txtVolta.text == ''){
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: MyAppBar('Adicionar destino'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                TxtEntrada(rotulo: 'Destino da viagem', controle: txtDestino),
                TxtEntrada(rotulo: 'Data da Ida', controle: txtIda),
                TxtEntrada(rotulo: 'Data do Retorno', controle: txtVolta),

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
                          await db.collection("destinos").add(
                            {
                              "destino" : txtDestino.text,
                              "ida" : txtIda.text,
                              "volta" : txtVolta.text,
                            }
                          );
                        } else{
                          //Atualizar os dados da coleção 'destinos'
                          await db.collection("destinos").doc(id).update(
                            {
                              "destino" : txtDestino.text,
                              "ida" : txtIda.text,
                              "volta" : txtVolta.text,
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