import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/recipe.dart';

class RecipeListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RecipeListScreenState();
  }

}

class RecipeListScreenState extends State<RecipeListScreen>{

  final List<Recipe> recipes = [
    Recipe(
        "Pizza facile",
        "Par Tom Ribardière",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champignons.\n\nDans un bol, verser la boîte de concentré de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre (pour enlever l'acidité de la tomate) une pincée de sel, de poivre, et une pincée d'herbe de Provence. \n\nDérouler la pâte à pizza sur le lèche frite de votre four, piquer-le.\n\nAvec une cuillère à soupe, étaler délicatement la sauce tomate, ensuite y ajouter les lardons et les champignons bien dorer. Parsemer de fromage râpée\n\nMettre au four à 220°, thermostat 7-8, pendant 20 min (ou lorsque le dessus de la pizza est doré). ",
        false,
        50),
    Recipe(
        "Pizza pas facile",
        "Par Tom Ribardière",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champignons.\n\nDans un bol, verser la boîte de concentré de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre (pour enlever l'acidité de la tomate) une pincée de sel, de poivre, et une pincée d'herbe de Provence. \n\nDérouler la pâte à pizza sur le lèche frite de votre four, piquer-le.\n\nAvec une cuillère à soupe, étaler délicatement la sauce tomate, ensuite y ajouter les lardons et les champignons bien dorer. Parsemer de fromage râpée\n\nMettre au four à 220°, thermostat 7-8, pendant 20 min (ou lorsque le dessus de la pizza est doré). ",
        false,
        50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Recettes"),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index){
          final recipe = recipes[index];
          return Dismissible(
              key: Key(recipe.title),
              onDismissed: (direction){
                setState(() {
                  recipes.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:Text("${recipe.title} supprimé" )));
              },
              background: Container(color: Colors.red),
              child: RecipeItemWidget(recipe: recipe));
        },
      )
    );
  }

}

class RecipeItemWidget extends StatelessWidget{

  final Recipe recipe;

  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 8,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: recipe.imageUrl,
            placeholder: (context, url)=>
                Center (child: CircularProgressIndicator()),
            errorWidget: (context,url,error)=> Icon(Icons.error),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                ),
                Text(recipe.user,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16))
              ],
            ),
          )
        ],
      ),
    );
  }

}