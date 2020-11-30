import 'package:flutter/material.dart';
import '../widgets.dart';

class InfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Sobre o aplicativo'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(40),            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Image.asset('imagens/logotipo.png', scale: 0.8,),
                Container(                  
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0, 
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                  child: Text(
                    "Esse aplicativo foi desenvolvido para facilitar a vida dos apaixonados por viagens e, principalmente, por planejar cada detalhe da sua próxima aventura.\n\nVocê está cansado de utilizar diferentes aplicações para ter todas as informações necessárias na palma da mão quando você viaja?\nEsse aplicativo permite consolidá-las em um único lugar de forma simples e fácil de encontrar.\n\nVocê sempre se esquece de algo importante e precisa correr atrás na última hora?\nNão se preocupe, aqui você encontra um checklist para auxiliá-lo durante todo o seu planejamento.\n\nE aí, animado para planejar seu próximo destino?",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),                    
                  ),                  
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Image.asset('imagens/desenvolvedora.jpg',),),
                      Expanded(
                          child: Text(
                            "Desenvolvido por Aline Mizumukai\nApaixonada por viagens e por conhecer novas culturas\nFoto: Granada - Espanha",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}