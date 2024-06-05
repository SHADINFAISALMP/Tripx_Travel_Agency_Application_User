import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/hotel/hotel_state.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());

  Future<void> searchHotels(String? hotelCity, DateTime? checkin, DateTime? checkout) async {
    if (hotelCity == null || hotelCity.isEmpty) {
      emit(HotelError('Please enter a search query'));
      return;
    }

    emit(HotelLoading());

    try {
      final url =
          'https://serpapi.com/search.json?engine=google_hotels&q=$hotelCity&gl=us&hl=en&currency=USD&check_in_date=${checkin?.toString().substring(0, 10)}&check_out_date=${checkout?.toString().substring(0, 10)}&api_key=6c85fbfd79fdcabfe8b5366842b277c39501f6eabded41ad96ceda658b200efc';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final List<dynamic>? data = jsonResponse.containsKey('hotels')
            ? jsonResponse['hotels']
            : jsonResponse['properties'];
        if (data != null && data.isNotEmpty) {
          emit(HotelLoaded(data));
        } else {
          emit(HotelError('No hotels found for the given search query'));
        }
      } else {
        throw Exception('Failed to load hotels. Status code: ${response.statusCode}');
      }
    } on SocketException {
      emit(HotelError('Please check your internet connection'));
    } catch (e) {
      emit(HotelError('Error: $e'));
    }
  }
}
