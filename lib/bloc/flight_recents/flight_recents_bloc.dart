import 'package:bloc/bloc.dart';


part 'flight_recents_event.dart';
part 'flight_recents_state.dart';

class RecentSearchBloc extends Bloc<RecentSearchEvent, RecentSearchState> {
  RecentSearchBloc() : super(RecentSearchInitial());

  final List<Map<String, String>> _recentSearches = [];

  Stream<RecentSearchState> mapEventToState(RecentSearchEvent event) async* {
    if (event is AddSearchEvent) {
      _recentSearches.add({
        'departureCity': event.departureCity,
        'arrivalCity': event.arrivalCity,
        'date': event.date,
      });
      yield RecentSearchLoaded(_recentSearches);
    } else if (event is ClearSearchesEvent) {
      _recentSearches.clear();
      yield RecentSearchLoaded(_recentSearches);
    }
  }
}