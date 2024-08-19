import 'exception/exception.handler.dart';
import 'exception/failure.dart';

/// Result class
///
/// This class is used to represent the result of an operation.
/// It can be a success, a failure, or a loading state.
///
/// The [Result] is a sealed class that has three subclasses:
/// - [SuccessResult] for successful operations
/// - [ErrorResult] for failed operations
/// - [LoadingResult] for operations that are still in progress
///
/// The [Result] class provides a set of utility methods to work with the result:
/// - [guard] method to handle exceptions and return a [Result]
/// - [guardFuture] method to handle exceptions in async operations and return a [Result]
/// - [failIf] method to return an error result if a condition is met
/// - [ifFailure] method to execute a function if the result is a failure
/// - [handleFailure] method to show an error dialog if the result is a failure
/// - [getFailure] method to get the failure object if the result is a failure
///
/// Extensions:
/// - [asSuccess] extension method to convert a value to a [SuccessResult]
/// - [asFailure] extension method to convert an exception to an [ErrorResult]
sealed class Result<T> {
  Result._();

  /// Guard an operation and return a [Result]
  ///
  /// This method is used to handle exceptions and return a [Result].
  /// [resolveFailure] parameter can be used to resolve the failure object before returning the [ErrorResult].
  static Result<T> guard<T>(
    T Function() body,
    Failure Function(Failure failure)? resolveFailure,
  ) {
    try {
      return SuccessResult(body());
    } on Exception catch (e) {
      Failure failure = ExceptionHandler.handle(e).failure;
      failure = resolveFailure?.call(failure) ?? failure;
      return ErrorResult<T>(failure);
    }
  }

  /// Guard an async operation and return a [Result]
  ///
  /// This method is used to handle exceptions in async operations and return a [Result].
  /// [resolveFailure] parameter can be used to resolve the failure object before returning the [ErrorResult].
  /// [handleFailure] parameter can be used to automatically show an error dialog if the operation fails.
  static Future<Result<T>> guardFuture<T>(
    Future<T> Function() future, {
    Failure Function(Failure failure)? resolveFailure,
    bool handleFailure = false,
  }) async {
    late ErrorResult<T> result;

    try {
      return SuccessResult(await future());
    } on Exception catch (e) {
      Failure failure = ExceptionHandler.handle(e).failure;
      failure = resolveFailure?.call(failure) ?? failure;
      result = ErrorResult<T>(failure);
    } on Error catch (e) {
      result = ErrorResult<T>(UnknownFailure(e.toString()));
    }

    if (handleFailure) {
      await result.handleFailure();
    }

    return result;
  }

  bool get isSuccess => this is SuccessResult;
  bool get isLoading => this is LoadingResult;
  bool get isFailure => this is ErrorResult;

  T? get dataOrNull {
    if (this is SuccessResult<T>) {
      return (this as SuccessResult<T>).value;
    } else {
      return null;
    }
  }

  T get dataOrThrow {
    if (this is SuccessResult<T>) {
      return (this as SuccessResult<T>).value;
    }

    if (this is ErrorResult<T>) {
      throw (this as ErrorResult<T>).error;
    }

    if (this is LoadingResult<T>) {
      throw StateError('Result is loading');
    }

    throw StateError('Unknown result type');
  }

  T getOrElse(Function() orElse) {
    if (this is SuccessResult) {
      return (this as SuccessResult<T>).value;
    } else {
      return orElse();
    }
  }

  static Result failIf(bool Function() verify, String reason) {
    if (verify()) {
      return ErrorResult(
        ExceptionHandler.handle(Exception(reason)).failure,
      );
    }

    return SuccessResult(null);
  }

  void ifFailure(Function(Failure failure) body) {
    if (this is ErrorResult) {
      body((this as ErrorResult<T>).error);
    }
  }

  Future<void> handleFailure({Function? onConfirm}) async {
    if (this is ErrorResult) {
      final failure = (this as ErrorResult<T>).error;
      // return await showErrorDialogFromFailure(
      //   failure,
      //   onConfirm: onConfirm,
      // );
    }
  }

  Failure? getFailure() {
    if (this is ErrorResult) {
      return (this as ErrorResult<T>).error;
    }
    return null;
  }
}

extension ResultObjectExt<T> on T {
  Result<T> get asSuccess => SuccessResult(this);

  Result<T> asFailure(Exception e) => ErrorResult(ExceptionHandler.handle(e).failure);
}

class LoadingResult<T> extends Result<T> {
  LoadingResult() : super._();
}

class SuccessResult<T> extends Result<T> {
  SuccessResult(this.value) : super._();

  final T value;
}

class ErrorResult<T> extends Result<T> {
  ErrorResult(this.error) : super._();

  final Failure error;
}
