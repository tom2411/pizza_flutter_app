import 'package:flutter/material.dart';
import 'package:flutter_app/recipe.dart';
import 'package:flutter_app/recipeListScreen.dart';
import 'package:flutter_app/recipe_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
       home:  RecipeListScreen(),
      // RecipeScreen(
      //     recipe: Recipe(
      //       "Pizza facile",
      //       "Par Tom Ribardière",
      //       "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
      //       "Faire cuire dans une poêle les lardons et les champignons.\n\nDans un bol, verser la boîte de concentré de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre (pour enlever l'acidité de la tomate) une pincée de sel, de poivre, et une pincée d'herbe de Provence. \n\nDérouler la pâte à pizza sur le lèche frite de votre four, piquer-le.\n\nAvec une cuillère à soupe, étaler délicatement la sauce tomate, ensuite y ajouter les lardons et les champignons bien dorer. Parsemer de fromage râpée\n\nMettre au four à 220°, thermostat 7-8, pendant 20 min (ou lorsque le dessus de la pizza est doré). ",
      //       false,
      //       50)
      //),
    );
  }
}



