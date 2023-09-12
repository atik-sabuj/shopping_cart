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


          const SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot){
              if(snapshot.hasData){
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                        height: 100,
                                        width: 100,
                                        image: NetworkImage(snapshot.data![index].image.toString()),
                                      ),
                                      const SizedBox(width: 10,),

                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(snapshot.data![index].productName.toString(),
                                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                ),
                                                InkWell(
                                                    onTap: (){

                                                    },
                                                    child: Icon(Icons.delete)),
                                              ],
                                            ),
                                            const SizedBox(height: 5,),
                                            Text(snapshot.data![index].unitTag.toString() +" "+r"$"+ snapshot.data![index].productPrice.toString(),
                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 5,),

                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: (){



                                                },
                                                child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Center(
                                                    child: Text('Add to Cart', style: TextStyle(color: Colors.white),),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                );
              }
              return Text('');
         }),

          Consumer<CartProvider>(builder: (context, value, child){
            return Column(
              children: [
                ReusableWidget(
                  title: 'Sub Total',
                  value: r'$'+value.getTotalPrice().toString(),)
              ],
            );
          }),
        ],
      ),
    );
  }
}




class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.subtitle2,),
          Text(value.toString(), style: Theme.of(context).textTheme.subtitle2,)
        ],
      ),
    );
  }
}
