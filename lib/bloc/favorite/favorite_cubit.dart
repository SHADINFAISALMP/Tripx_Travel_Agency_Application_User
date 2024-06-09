import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/favorite/favorite_state.dart';
import 'package:tripx_user_application/screens/favorites/favorite_manager.dart';

class HomescreenListItemsCubit extends Cubit<HomescreenListItemsState> {
  HomescreenListItemsCubit()
      : super(HomescreenListItemsState(isFavorite: false));

  Future<void> checkIfFavorite(String itemId) async {
    bool favoriteStatus = await FavoriteManager.isFavorite(itemId);
    emit(HomescreenListItemsState(isFavorite: favoriteStatus));
  }

  Future<void> toggleFavorite(
      String itemId, Map<String, dynamic> itemData) async {
    final bool newFavoriteStatus = !state.isFavorite;

    await FavoriteManager.toggleFavorite(itemId, itemData);
    emit(HomescreenListItemsState(isFavorite: newFavoriteStatus));
  }
}
