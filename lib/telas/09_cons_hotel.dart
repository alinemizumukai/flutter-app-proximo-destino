import 'package:flutter/material.dart';
import '../widgets.dart';

class PlannerHospedagem extends StatefulWidget {
  @override
  _PlannerHospedagemState createState() => _PlannerHospedagemState();
}

class _PlannerHospedagemState extends State<PlannerHospedagem> {

  @override
  Widget build(BuildContext context) {
    Map dadosHotel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: MyAppBar('Hospedagem'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              color: Colors.grey[100],   
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Orçamento #1', style: TextStyle(fontSize: 18),),
                    Text('Hotel: ${dadosHotel['Hotel']}'),
                    Text('Local: ${dadosHotel['Local']}'),
                    Text('Telefone: ${dadosHotel['Telefone']}'),
                    Text('Check-in: ${dadosHotel['Checkin']}'),
                    Text('Check-out: ${dadosHotel['Checkout']}'),
                    Text('Preço: ${dadosHotel['Preco']}'),
                  ]
                ),
              ),
            ),
          ],
        ),

      ),

      
    );
  }
}