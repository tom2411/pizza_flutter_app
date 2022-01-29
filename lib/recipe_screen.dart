import 'package:flutter/material.dart';
import 'package:flutter_app/favoriteWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecipeScreen extends StatelessWidget {

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
                  child: Text("Pizza Facile",
                      style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20
                      )),
                ),
                Text("Par Tom Ribardière",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16
                    )),
              ],
            ),
          ),
          FavoriteWidget(isFavorited: true, favoriteCount: 10),
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
      child: Text("Faire cuire dans une poêle les lardons et le champignons. \nDans un bol, verser la boîte de concentré de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre (pour enlever l'acidité de la tomate) une pincée de sel, de poivre, d'herbes de Provence.",
          softWrap: true
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Recettes"),
      ),
      body: ListView(
          children: [
            CachedNetworkImage(
              imageUrl: "https://assets.afcdn.com/recipe/20160519/15342_w1024h768c1cx3504cy2338.webp",
              placeholder: (context,url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context,url, error) => Icon(Icons.error),
              width: 600,
              height: 240,
              fit: BoxFit.cover,
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
    );
  }
}