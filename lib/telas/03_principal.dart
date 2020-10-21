import 'package:flutter/material.dart';
import '../widgets.dart';

class NovoDestino extends StatefulWidget {
  @override
  _NovoDestinoState createState() => _NovoDestinoState();
}

class _NovoDestinoState extends State<NovoDestino> {
  
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var txtDestino = TextEditingController(); 
  var destinos = List <String> ();
    
  @override
  void initState(){
    destinos.add('Miami');
    destinos.add('Rio de Janeiro');    
    destinos.sort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar('Meus Destinos'),
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
                      controller: txtDestino,
                      decoration: InputDecoration(
                        labelText: 'Adicionar novo destino',
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: (){
                      setState(() {
                        destinos.add(txtDestino.text);
                        destinos.sort();
                        txtDestino.text = '';
                        scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text('Destino adicionado.'),
                            duration: Duration(seconds: 2),
                          ),
                        );  
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
                child: ListView.separated(
                itemBuilder: (context,index){
                  return Container(
                    child: Destino(destino: destinos[index],
                        delete: (){
                          setState((){
                            destinos.removeAt(index);
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text('Destino removido.'),
                                duration: Duration(seconds: 2),
                              ),
                            );  
                          });
                        }
                      ),
                  );
                },
                separatorBuilder: (context, index){
                  return Divider(thickness: 0);
                },
                 itemCount: destinos.length                        
              ),
            ),
          ],
        ),
      ),      
    );
  }
}