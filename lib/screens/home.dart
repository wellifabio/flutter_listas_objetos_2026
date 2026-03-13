import 'package:flutter/material.dart';
import '../models/pessoa.dart';
import '../dados/pessoas.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tabela = PessoasList.tabela;
  List<Pessoa> selecionadas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pessoas')),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int indice) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: Image.network(
                tabela[indice].avatar.toString(),
              ).image,
              radius: 30,
            ),
            contentPadding: const EdgeInsets.all(8),
            title: Text(tabela[indice].nome),
            subtitle: Text(tabela[indice].diagnostico()),
            trailing: Text(
              'IMC: ${tabela[indice].imc().toStringAsFixed(2)}',
              style: TextStyle(
                color:
                    tabela[indice].imc() < 18.5 || tabela[indice].imc() > 29.9
                    ? Colors.red
                    : Colors.green,
                fontSize: 18,
              ),
            ),
            selected: selecionadas.contains(tabela[indice]),
            selectedTileColor: Colors.yellow[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onLongPress: () => {
              setState(() {
                selecionadas.contains(tabela[indice])
                    ? selecionadas.remove(tabela[indice])
                    : selecionadas.add(tabela[indice]);
                // print(selecionadas.length);
              }),
            },
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, ___) => const Divider(),
        itemCount: tabela.length,
      ),
    );
  }
}
