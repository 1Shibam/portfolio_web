import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/helper/json_loader.dart';
import 'package:portfolio_web/model/data_model.dart';

class UserDataNotifier extends StateNotifier<AsyncValue<User>> {
  final JsonLoader json;
  UserDataNotifier(this.json) : super(const AsyncValue.loading());

  Future<void> loadData() async {
    try {
      state = const AsyncValue.loading();
      final fetchedData = await json.loadData();
      state = AsyncValue.data(fetchedData);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
