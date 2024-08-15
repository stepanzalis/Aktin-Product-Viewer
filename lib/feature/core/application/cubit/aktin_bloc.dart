import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Base for Bloc prepared with cancelToken
/// which is automatically closed.
abstract class AktinBloc<Event, State> extends Bloc<Event, State> {
  AktinBloc(super.initialState);

  final CancelToken cancelToken = CancelToken();

  @override
  Future<void> close() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel();
    }

    return super.close();
  }

  @override
  void emit(State state) {
    if (isClosed) return;

    // ignore: invalid_use_of_visible_for_testing_member
    super.emit(state);
  }
}
