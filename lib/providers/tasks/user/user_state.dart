import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class UserState extends Equatable {
  final String userName;

  const UserState({
    required this.userName,
  });

  UserState copyWith({
    String? userName,
  }) {
    return UserState(
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object?> get props => [userName];
}
