import 'package:Hotelino/features/home/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'هتل های مورد علاقه',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16,),
            SearchBarWidget(),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
