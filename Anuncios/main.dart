import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imagens = [
    'livro1.jpeg',
    'livro2.jpeg',
    'livro3.jpg',
    'livro4.jpeg',
    'livro5.jpeg',
  ];

  final List<String> textos = [
    'Livro Pai e Filhos\nR\$ 67,00',
    'Livro Crime e Castigo\nR\$ 45,00',
    'Livro HitchcockTruffaut\nR\$ 121,00',
    'Livro Quincas Borba\nR\$ 15,00',
    'Livro Senhor dos Anéis: A Sociedade do Anel\nR\$ 86,00',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Anúncios"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _corpo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _carrosel(),
          ],
        ),
      ),
    );
  }

  _carrosel() {
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      height: 500,
      child: PageView.builder(
        itemCount: imagens.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 30), // Espaçamento entre a imagem e o AppBar
              _foto(imagens[index]),
              _texto(textos[index]),
            ],
          );
        },
      ),
    );
  }

  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 260,
      width: 260,
      fit: BoxFit.contain,
    );
  }

  _texto(String texto) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20),
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
