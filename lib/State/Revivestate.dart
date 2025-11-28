abstract class Revivestate<T> {}

class ReviveInitial<T> extends Revivestate<T> {}

class ReviveLoading<T> extends Revivestate<T> {}

class ReviveLoaded<T> extends Revivestate<T> {
  Map<String, dynamic> data;
  ReviveLoaded(this.data);
}

class ReviveError<T> extends Revivestate<T> {
  final String error;
  ReviveError(this.error);
}
