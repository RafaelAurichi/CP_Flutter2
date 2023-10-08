import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: _titulo(),
          backgroundColor: Colors.white,
          body: _body(),
        ),
      ),
    );
  }

  _titulo() {
    return AppBar(
        title: Text("App Meu Perfil"),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: TabBar(tabs: [
          Tab(
            text: 'Pessoal',
          ),
          Tab(
            text: 'Formação',
          ),
          Tab(
            text: 'Experiência',
          ),
        ]));
  }

  _body() {
    return TabBarView(
      children: [
        Center(
            child: Text(
          'Nome: Rafael Aurichi\nIdade: 21\nEstado Civil: Solteiro',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        Center(
            child: Text(
          'Formação:\nTécnico em Administração\nProdução Audiovisual\nSistemas para Internet',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        Center(
            child: Text(
          'Experiência:\nEditor \nDesenvolvedor Front-end\nFilmmaker',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ],
    );
  }
}
