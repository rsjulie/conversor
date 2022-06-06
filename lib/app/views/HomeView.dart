import 'package:conversor/app/components/currency_box.dart';
import 'package:conversor/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;
  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 250,
              ),
              const SizedBox(height: 20),
              CurrencyBox(
                selectedItem: homeController.toCurrency!,
                items: homeController.currencies!,
                controller: toText,
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model;
                  });
                },
              ),
              const SizedBox(height: 10),
              CurrencyBox(
                selectedItem: homeController.fromCurrency!,
                items: homeController.currencies!,
                controller: fromText,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model;
                  });
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  homeController.convert();
                },
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                child: const Text('CONVERTER'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
