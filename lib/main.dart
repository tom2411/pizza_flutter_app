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
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
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

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context)=> RecipeListScreen());
      case '/recipe':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => RecipeScreen(recipe: settings.arguments as Recipe),
            transitionsBuilder:  (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(parent: animation, curve: Curves.ease);
              return FadeTransition(
                opacity: animation,
                child: child,

              );

              // var begin = Offset(0.0, 1.0);
              // var end = Offset.zero;
              // var curve = Curves.ease;
              // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              // return SlideTransition(
              //   position: animation.drive(tween),
              //   child: child,
              // );
            });
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text("Error"), centerTitle: true),
            body: Center(
              child: Text("Page not found"),
            ),
          )
        );
    }
  }
}



