import 'package:flutter/material.dart';
import 'package:flutter_app/favoriteChangenotifier.dart';
import 'package:flutter_app/favoriteWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/recipe.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatelessWidget {

  final Recipe recipe;

  const RecipeScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                      style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20
                      )),
                ),
                Text(recipe.user,
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16
                    )),
              ],
            ),
          ),
          FavoriteIconWidget(),
          FavoriteTextWidget(),
        ],
      ),
    );

    Column _buildButtonColumn (Color color,IconData icon, String label) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Icon(icon, color: color),
          ),
          Text(label, style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color
          ),),
        ],
      );
    }

    Widget buttonSection =
    Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue ,Icons.comment,  "COMMENT"),
          _buildButtonColumn(Colors.blue ,Icons.share,  "SHARE"),
        ],
      ),
    );

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(12),
      child: Text(recipe.description,
          softWrap: true
      ),
    );


    return ChangeNotifierProvider(
      create: (context) => FavoriteChangeNotifier(recipe.isFavorite, recipe.favoriteCount),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mes Recettes"),
        ),
        body: ListView(
            children: [
              Hero(
                tag: "imageRecipe"+recipe.title,
                child: CachedNetworkImage(
                  imageUrl: recipe.imageUrl,
                  placeholder: (context,url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context,url, error) => Icon(Icons.error),
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              /* Image.asset( image avec des assets dans le dossier images
              'images/pizza.png',
              width: 600,
              height: 200,
              fit: BoxFit.cover,
            ),*/
              /* Image.network( image par URL
              'https://assets.afcdn.com/recipe/20160519/15342_w600.jpg',
              width: 600,
              height: 200,
              fit: BoxFit.cover,
            ),*/
              titleSection,
              buttonSection,
              descriptionSection,
            ]
        ),
      ),
    );
  }
}