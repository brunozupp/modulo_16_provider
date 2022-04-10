import 'package:flutter/material.dart';
import 'package:modulo_16_provider/provider/user_model.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var user = Provider.of<UserModel>(context);

    // .read ele vai retornar uma instância sem ficar escutando alterações
    //var user = context.read<UserModel>();

    // .select<Objeto Inteiro, Parte que eu quero pegar>
    var imageAvatar = context.select<UserModel, String>((user) => user.imgAvatar);

    // Fica escutando por alterações
    //var user = context.watch<UserModel>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageAvatar),
                radius: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Nome: ${user.name}"),
              Text("Nascimento: ${user.birthDate}")
            ],
          ),
        ),
      ),
    );
  }
}