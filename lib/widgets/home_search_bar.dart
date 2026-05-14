import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {

  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    return TextField(

      decoration: InputDecoration(

        hintText:
            'Buscar comidas saludables',

        prefixIcon:
            const Icon(Icons.search),

        filled: true,

        fillColor: Colors.white,

        border: OutlineInputBorder(

          borderRadius:
              BorderRadius.circular(16),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}