import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/shared/services/json_data_service.dart';

class HotelRepository {
  final JsonDataService jsonDataService;

  HotelRepository({required this.jsonDataService});

  Future<List<Hotel>> fetchHotels() async {
    return jsonDataService.loadHotels();
  }

  //give me id and say you what is hotels
  Future<Hotel> getHotelById(String id){
    return jsonDataService.loadHotels().then(
      (hotels) {
        return hotels.firstWhere((hotel) => hotel.id == id ,);
      },
    );
  }


}