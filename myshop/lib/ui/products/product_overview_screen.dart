import 'package:flutter/material.dart';
import 'products_grid.dart';
import '../shared/app_drawer.dart';
enum FilterOptions { favorite, all }

class ProductsOverviewScreen extends StatefulWidget{
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState()=>_ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductsOverviewScreen>{
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
  Widget buildShoppingCartIcon(){
    return IconButton(
      icon: const Icon(
        Icons.shopping_cart,
      ),
      onPressed: (){
      print('Go to cart screen');
      },
    );
  }
  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue){
        setState(() {
          if (selectedValue == FilterOptions.favorite){
            _showOnlyFavorites = true;
          } else {
            _showOnlyFavorites = false;
          }
          });
        },
        icon: const Icon(
          Icons.more_vert,
        ),
        itemBuilder: (ctx)=>[
          const PopupMenuItem(
            value: FilterOptions.favorite,
            child: Text('Only Favorites'),
          ),
          const PopupMenuItem(
            value: FilterOptions.all,
            child: Text('Show All'),
          ),
        ],
    );
  }
}