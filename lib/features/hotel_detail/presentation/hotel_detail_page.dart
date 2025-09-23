import 'package:Hotelino/core/utils/network.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:Hotelino/shared/services/json_data_service.dart';
import 'package:flutter/material.dart';

class HotelDetailPage extends StatelessWidget {
  final String hotelId;
  const HotelDetailPage({super.key, required this.hotelId});

  @override
  Widget build(BuildContext context) {
    final hotelRepository = HotelRepository(jsonDataService: JsonDataService());
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<Hotel>(
      future: hotelRepository.getHotelById(hotelId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final hotel = snapshot.data!;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: GestureDetector(
                    onLongPress: () {
                      
                    },
                    child: Image.network(
                      fit: BoxFit.cover,
                      networkUrl(hotel.images.first),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      },
    );
  }
}
