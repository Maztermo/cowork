import 'package:cowork/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_state.dart';

final userProvider =
    StateNotifierProvider.autoDispose<UserController, UserState>((ref) {
  return UserController(
    const UserState(
      userName: "loading...",
    ),
  );
});

class UserController extends StateNotifier<UserState> {
  UserController(
    UserState state,
  ) : super(state) {
    getUserName();
  }

  final userRepo = UserRepository();
  Future getUserName() async {
    var userName = await userRepo.getUserName();
    state = state.copyWith(userName: userName);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
