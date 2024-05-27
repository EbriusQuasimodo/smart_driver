import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPasswordSignInState {
  LoginPasswordSignInState({
    this.value = const AsyncValue.data(null),
  });

  final AsyncValue<void> value;

  get isLoading => value.isLoading;

  LoginPasswordSignInState copyWith({
    AsyncValue<void>? value,
  }) {
    return LoginPasswordSignInState(
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'LoginPasswordSignInState(value: $value)';

  @override
  bool operator ==(covariant LoginPasswordSignInState other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
