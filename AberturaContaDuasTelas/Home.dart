import 'package:flutter/material.dart';
import 'Sobre.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccountOpeningForm(),
    );
  }
}

class AccountOpeningForm extends StatefulWidget {
  @override
  _AccountOpeningFormState createState() => _AccountOpeningFormState();
}

class _AccountOpeningFormState extends State<AccountOpeningForm> {
  String? nome;
  TextEditingController idadeController = TextEditingController();
  String? sexo;
  String? escolaridade;
  double limiteDaConta = 500.0;
  String? nacionalidade;
  bool mostrarDados = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abertura de Conta Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nome = value;
                  },
                ),
                TextFormField(
                  controller: idadeController,
                  decoration: InputDecoration(labelText: 'Idade'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua idade';
                    }
                    return null;
                  },
                ),

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Sexo'),
                  items: ['Masculino', 'Feminino', 'Outro'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      sexo = value;
                    });
                  },
                ),

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Escolaridade'),
                  items: [
                    'Ensino Fundamental',
                    'Ensino Médio',
                    'Graduação',
                    'Pós-Graduação'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      escolaridade = value;
                    });
                  },
                ),

                Slider(
                  value: limiteDaConta,
                  onChanged: (value) {
                    setState(() {
                      limiteDaConta = value;
                    });
                  },
                  min: 0,
                  max: 1000,
                  divisions: 100,
                  label: 'Limite da Conta: ${limiteDaConta.toStringAsFixed(2)}',
                ),
                SwitchListTile(
                  title: Text('Brasileiro?'),
                  value: nacionalidade ==
                      'Brasileiro', // Verifica se a nacionalidade é brasileira
                  onChanged: (value) {
                    setState(() {
                      nacionalidade = value ? 'Brasileiro' : 'Estrangeiro';
                    });
                  },
                ),

                // Resto dos campos do formulário
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SobrePage(
                            nome: nome,
                            idade: idadeController.text,
                            sexo: sexo,
                            escolaridade: escolaridade,
                            limiteDaConta: limiteDaConta,
                            nacionalidade: nacionalidade,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                  ),
                  child: Text(
                    'Confirmar',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (mostrarDados)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dados da Conta Bancária:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Nome: $nome', style: TextStyle(fontSize: 16)),
                      Text('Idade: ${idadeController.text}',
                          style: TextStyle(fontSize: 16)),
                      // Resto dos campos de dados
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
