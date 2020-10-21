import 'package:flutter/material.dart';
import '../widgets.dart';

class Bagagem extends StatefulWidget {
  @override
  _BagagemState createState() => _BagagemState();
}

class _BagagemState extends State<Bagagem> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var txtItem = TextEditingController(); 
  var bag = List<String>();

  @override
  void initState(){
    bag.add("Camiseta");
    bag.add("Calça");    
    bag.add("Tênis");
    bag.add("Chinelo");
    bag.add("Carregador de celular");
    bag.add("Shampoo/Condicionador");
    bag.add("Perfume");
    bag.add("Remédio");
    bag.add("Blusa de frio");
    bag.sort();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar('Lista - Bagagem'),
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
                      controller: txtItem,
                      decoration: InputDecoration(
                        labelText: 'Adicionar item',
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: (){
                      setState(() {
                        bag.add(txtItem.text);
                        bag.sort();
                        txtItem.text = '';
                        scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text('Item adicionado.'),
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
                    title: Text(bag[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline, size: 18),
                      tooltip: 'Excluir',
                      onPressed: (){
                        setState(() {
                          bag.removeAt(index);
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Item removido.'),
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
              itemCount: bag.length
            ),
            ),
          ],
        ),
      ),
    );
  }
}

