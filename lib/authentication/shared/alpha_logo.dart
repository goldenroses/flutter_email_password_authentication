import 'package:flutter/material.dart';

class AlphaLogo extends StatelessWidget {
  const AlphaLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(
          left: 22,
          bottom: 20,
        ),
        child: Center(
            child: Text(
              "Alpha App",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.fontSize,
              ),
            )),
      ),
    );
  }
}
