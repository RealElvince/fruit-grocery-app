import 'package:flutter/material.dart';

class MyGroceryTile extends StatelessWidget {
  MyGroceryTile(
      {super.key,
      required this.itemPrice,
      required this.itemName,
      required this.imagePath,
      required this.color,
      required this.onPressed});

  final String itemPrice;
  final String itemName;
  final String imagePath;
  final color;
  void Function()? onPressed;
  //void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            Image.asset(
              fit: BoxFit.fill,
              imagePath,
              height: 100.0,
            ),

            const SizedBox(
              height: 10.0,
            ),
            //item name
            Text(
              itemName,
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
            ),
            // Price + button
            MaterialButton(
              color: Colors.white30,
              onPressed: onPressed,
              child: Text(
                '$itemPrice KES',
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
