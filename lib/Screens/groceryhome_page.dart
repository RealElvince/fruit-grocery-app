import 'package:flutter/material.dart';
import 'package:groceryapp/Screens/ShoppingPage.dart';
import 'package:groceryapp/constants.dart';
import 'package:groceryapp/components/grocery_tile.dart';
import 'package:groceryapp/models/cart_model.dart';
import 'package:provider/provider.dart';

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({
    super.key,
  });

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  // Greetings Finction

  String greetings() {
    final hour = TimeOfDay.now().hour;

    if (hour <= 12) {
      return ' Good morning';
    } else if (hour <= 17) {
      return ' Good afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ShoppingPage();
        })),
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white70,
          size: 25.0,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 24.0,
            ),
            //Greetings
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Good morning,Elvo',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 24.0,
            ),
            // Text  section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Fast grocery deliveries is our passion.Let\'s make fresh order for you.',
                style: kGroceryPageTextStyle,
              ),
            ),
            // Divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 4.0,
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),

            // Fresh Items
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Fresh Items:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
              ),
            ),

            const SizedBox(
              height: 24.0,
            ),

            // GridView
            Expanded(
              child: Consumer<CartModel>(builder: (context, value, child) {
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: value.cartItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0 / 1.2, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return MyGroceryTile(
                      itemName: value.cartItems[index][0],
                      itemPrice: value.cartItems[index][1],
                      imagePath: value.cartItems[index][2],
                      color: value.cartItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemsToShoppingCart(index);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
