import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Base for Bloc prepared with cancelToken
/// which automatically cancels the request when the bloc is closed.
abstract class AppBloc<Event, State> extends Bloc<Event, State> {
  AppBloc(super.initialState);

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
