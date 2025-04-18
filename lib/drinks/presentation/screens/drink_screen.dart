import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/drinks/domain/repositories/drinks_repository_impl.dart';
import 'package:flutter_application_1/drinks/domain/use_cases/use_cases.dart';
import 'package:flutter_application_1/drinks/presentation/logic/bloc/drinks_bloc.dart';
import 'package:flutter_application_1/drinks/widgets/custom_textfield.dart';
import 'package:flutter_application_1/drinks/widgets/drink_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({super.key});

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  final TextEditingController nameController = TextEditingController();

  final DrinksBloc drinksBloc = DrinksBloc(
    drinkUseCases: DrinkUseCases(
      drinkRepository: DrinkRepositoryImpl(),
    ),
  );

  void getDrinkByName() {
    drinksBloc.add(GetDrinkEvent(name: nameController.text.toString()));
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DrinksBloc, DrinksState>(
        bloc: drinksBloc,
        listener: (context, state) {
          if (state is DrinksErrorState) {
            log("Ошибка");
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("An error has been occured")));
          }
        },
        builder: (context, state) {
          if (state is DrinksLoadedState) {
            final drinkInfo = state.drink;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    CustomTextfield(
                      nameController: nameController,
                      onSubmitted: getDrinkByName,
                    ),
                    const SizedBox(height: 50),
                    DrinkCard(
                      imageURL: drinkInfo.strDrinkThumb ?? "",
                      name: drinkInfo.strDrink ?? "",
                      type: drinkInfo.strAlcoholic ?? "",
                      category: drinkInfo.strCategory ?? "",
                      price: "550",
                    )
                  ],
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                CustomTextfield(
                  nameController: nameController,
                  onSubmitted: getDrinkByName,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
