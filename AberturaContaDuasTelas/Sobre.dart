import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  final String? nome;
  final String? idade;
  final String? sexo;
  final String? escolaridade;
  final double limiteDaConta;
  final String? nacionalidade;

  SobrePage({
    required this.nome,
    required this.idade,
    required this.sexo,
    required this.escolaridade,
    required this.limiteDaConta,
    required this.nacionalidade,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dados da Conta Bancária:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Nome: $nome', style: TextStyle(fontSize: 16)),
            Text('Idade: $idade', style: TextStyle(fontSize: 16)),
            Text('Sexo: $sexo', style: TextStyle(fontSize: 16)),
            Text('Escolaridade: $escolaridade', style: TextStyle(fontSize: 16)),
            Text(
              'Limite da Conta: ${limiteDaConta.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            Text('Nacionalidade: $nacionalidade',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
