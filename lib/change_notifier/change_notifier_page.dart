import 'package:flutter/material.dart';
import 'package:modulo_16_provider/change_notifier/provider_controller.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({ Key? key }) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async { 
      await Future.delayed(const Duration(seconds: 2));

      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {

    print("BUILD");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Notifier"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: usandoSelector(),
      ),
    );
  }

  Widget usandoSelector() {
    return Column(
      children: [
        Selector<ProviderController, String>(
          selector: (context, controller) => controller.imgAvatar,
          builder: (context, imgAvatar, child) {
            print("BUILDANDO IMGAVATAR");
            return CircleAvatar(
              backgroundImage: NetworkImage(imgAvatar),
              radius: 60,
            );
          }
        ),
        const SizedBox(
          height: 10,
        ),
        Selector<ProviderController, String>(
          selector: (context, controller) => controller.name,
          builder: (context, name, child) {
            print("BUILDANDO NOME");
            return Text("Nome: $name");
          }
        ),
        Selector<ProviderController, String>(
          selector: (context, controller) => controller.birthDate,
          builder: (context, birthDate, child) {
            print("BUILDANDO BIRTHDATE");
            return Text("Nascimento: $birthDate");
          }
        ),
        // Caso queira alterar dois de uma vez
        Selector<ProviderController, Tuple2<String, String>>(
          selector: (context, controller) => Tuple2(controller.name, controller.birthDate),
          builder: (context, tuple, child) {
            print("BUILDANDO BIRTHDATE AND NAME");
            return Text("Nome: ${tuple.item1} - ${tuple.item2}");
          }
        ),
        const SizedBox(
          height: 30,
        ),

        ElevatedButton(
          onPressed: () {
            print("--------------------");
            context.read<ProviderController>().alterarNome();
          }, 
          child: const Text("Change Nome"),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            print("--------------------");
            context.read<ProviderController>().alterarBirthDate();
          }, 
          child: const Text("Change Nascimento"),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            print("--------------------");
            context.read<ProviderController>().alterarImgAvatar();
          }, 
          child: const Text("Change Avatar"),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            print("--------------------");
            context.read<ProviderController>().alterarNameAndBirthDate();
          }, 
          child: const Text("Change Name and Date"),
        ),
      ],
    );
  }

  Widget usandoConsumer() {
    return Column(
      children: [
        Consumer<ProviderController>(
          builder: (context, controller, child) {
            print("BUILDANDO IMGAVATAR");
            return CircleAvatar(
              backgroundImage: NetworkImage(controller.imgAvatar),
              radius: 60,
            );
          }
        ),
        const SizedBox(
          height: 10,
        ),
        Consumer<ProviderController>(
          builder: (context, controller, child) {
            print("BUILDANDO NOME");
            return Text("Nome: ${controller.name}");
          }
        ),
        Consumer<ProviderController>(
          builder: (context, controller, child) {
            print("BUILDANDO BIRTHDATE");
            return Text("Nascimento: ${controller.birthDate}");
          }
        ),
        const SizedBox(
          height: 30,
        ),

        ElevatedButton(
          onPressed: () {
            print("--------------------");
            context.read<ProviderController>().alterarNome();
          }, 
          child: const Text("Change Nome"),
        ),
      ],
    );
  }
}