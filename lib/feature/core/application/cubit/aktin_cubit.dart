import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Base for Cubit prepared with cancelToken
/// which is automatically closed.
abstract class AktinCubit<State> extends Cubit<State> {
  AktinCubit(super.initialState);

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

    super.emit(state);
  }
}
