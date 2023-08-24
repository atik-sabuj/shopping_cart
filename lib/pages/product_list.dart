
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
        actions: [
          Badge(
            alignment: AlignmentDirectional.bottomCenter,
            label: Text('0'),
            child: IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                // handle button press
              },
            ),
          ),
/*          Icon(Icons.shopping_bag_outlined),*/
        
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 300,
                itemBuilder: (context, index){
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(index.toString())
                      ],
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
