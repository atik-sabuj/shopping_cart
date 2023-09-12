import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/cart_model.dart';
import 'package:shopping_cart/provider/cart_provider.dart';
import 'package:badges/badges.dart' as badges;



class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
        centerTitle: true,
        actions: [
          Center(
            child: badges.Badge(
              badgeContent: Consumer<CartProvider>(
                builder: (context, value, child){
                  return Text(value.getCounter().toString(),
                      style: TextStyle(color: Colors.white));
                },

              ),
              //animationDuration: Duration(milliseconds: 300),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),


          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot){
              return Text('');
         })
        ],
      ),
    );
  }
}
