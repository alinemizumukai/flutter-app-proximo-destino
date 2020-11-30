import 'package:flutter/material.dart';
import '../widgets.dart';

class ImigracaoDoc extends StatefulWidget {
  @override
  _ImigracaoDocState createState() => _ImigracaoDocState();
}

class _ImigracaoDocState extends State<ImigracaoDoc> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var txtDocumento = TextEditingController(); 
  var docs = List<String>();

  @override
  void initState(){
    docs.add("Passaporte");
    docs.add("Visto");    
    docs.add("Comprovante Passagem de Volta");
    docs.add("Comprovante Hospedagem");
    docs.add("Seguro Viagem");
    docs.add("Comprovante de Renda");
    docs.add("Carteira de Vacinação Internacional");
    docs.add("Comprovante de Férias");
    docs.add("Comprovante de Trabalho");
    docs.sort();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar('Documentos para Imigração'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: txtDocumento,
                      decoration: InputDecoration(
                        labelText: 'Adicionar documento',
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: (){
                      setState(() {
                        docs.add(txtDocumento.text);
                        docs.sort();
                        txtDocumento.text = '';
                        // ignore: deprecated_member_use
                        scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text('Documento adicionado.'),
                                  duration: Duration(seconds: 2),
                                ),
                              );  
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),

            Expanded(child: ListView.separated(
              itemBuilder: (context,index){
                return Container(
                  child: ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text(docs[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline, size: 18),
                      tooltip: 'Excluir',
                      onPressed: (){
                        setState(() {
                          docs.removeAt(index);
                          // ignore: deprecated_member_use
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Documento removido.'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index){
                return Divider(thickness: 0);
              },
              itemCount: docs.length
            ),
            ),
          ],
        ),
      ),
    );
  }
}

