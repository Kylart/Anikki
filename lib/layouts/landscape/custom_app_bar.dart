
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: const [
                  FlutterLogo(
                    size: 52,
                  ),
                  Text('App Name'),
                ],
              ),
            ),
            const Flexible(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search anything',
                  suffixIcon: Icon(Icons.search)
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: CircleAvatar(
                child: Text('Ky'),
              ),
            )
          ],
        ),
      ),
    );
  }
}