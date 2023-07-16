class AuthState {
  final bool? authenticated;
  final bool loading;
  final bool? initial;

  AuthState({
    this.authenticated,
    this.loading = true,
    this.initial,
  });

//
  AuthState copyWith({
    bool? authenticated,
    bool? loading,
    bool? initial,
  }) {
    return AuthState(
      authenticated: authenticated ?? this.authenticated,
      loading: loading ?? this.loading,
      initial: initial ?? this.initial,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState &&
        other.authenticated == authenticated &&
        other.loading == loading &&
        other.initial == initial;
  }

  @override
  int get hashCode =>
      authenticated.hashCode ^ loading.hashCode ^ initial.hashCode;
}
