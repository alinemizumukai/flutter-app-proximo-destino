import 'package:app_atividade_avaliativa/telas/04_cadastro_geral.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_atividade_avaliativa/telas/01_login.dart';
import 'package:app_atividade_avaliativa/telas/02_cadastro.dart';
import 'package:app_atividade_avaliativa/telas/03_principal.dart';
import 'package:app_atividade_avaliativa/telas/99_info.dart';
import 'package:app_atividade_avaliativa/telas/05_menu.dart';
import 'package:app_atividade_avaliativa/telas/06_passagens.dart';
import 'package:app_atividade_avaliativa/telas/07_cons_passagens.dart';
import 'package:app_atividade_avaliativa/telas/08_hospedagem.dart';
import 'package:app_atividade_avaliativa/telas/09_cons_hotel.dart';
import 'package:app_atividade_avaliativa/telas/10_imigracao.dart';
import 'package:app_atividade_avaliativa/telas/11_bagagem.dart';
import 'package:app_atividade_avaliativa/telas/99_nulo.dart';


void main()async{

  //Registro do Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(

    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Próximo Destino',
      theme: ThemeData(
        primaryColor: Colors.cyan[600],
        backgroundColor: Colors.cyan[50],
        fontFamily: 'Englebert',                        
      ),
      home: Login(),
      initialRoute: '/tela1',
      routes: {
        '/tela1': (context) => Login(),
        '/tela2': (context) => Cadastro(),
        '/tela3': (context) => MenuInicial(),
        '/tela4': (context) => CadastroGeral(),       
        '/tela5': (context) => MenuPrincipal(),
        '/tela6': (context) => Passagens(),
        '/tela7': (context) => PlannerPassagens(),
        '/tela8': (context) => Hospedagem(), 
        '/tela9': (context) => PlannerHospedagem(),
        '/tela10': (context) => ImigracaoDoc(),
        '/tela11': (context) => Bagagem(),
        '/tela99': (context) => InfoApp(),    
        '/tela0':(context) => EmConstrucao(),
      },
    )
  );


}
