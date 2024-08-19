import 'package:equatable/equatable.dart';

/// Generic wrapper for API failures
sealed class Failure extends Equatable {
  final Map<String, dynamic> data;

  String get message {
    return "Unknown error";
  }

  String get title {
    return "Failure";
  }

  @override
  toString() {
    return 'Failure: $title - $message';
  }

  const Failure({this.data = const {}});

  @override
  List<Object?> get props => [data];
}

/// API client failures
class NoInternetFailure extends Failure {
  @override
  String get title => "No internet connection";

  @override
  String get message {
    return "You may have not latest data.";
  }
}

class ConnectionTimeoutFailure extends Failure {
  @override
  String get message {
    return 'Connection timeout';
  }
}

class SendTimeoutFailure extends Failure {
  @override
  String get message {
    return 'Send timeout';
  }
}

class ReceiveTimeoutFailure extends Failure {
  @override
  String get message {
    return 'Receive timeout';
  }
}

class CancelFailure extends Failure {
  @override
  String get message {
    return 'Request canceled';
  }
}

/// HTTP response failures
class BadResponseFailure extends Failure {
  @override
  final String message;
  const BadResponseFailure(this.message);
}

class BadRequestFailure extends BadResponseFailure {
  const BadRequestFailure(super.message);
}

class UnauthorizedFailure extends BadResponseFailure {
  const UnauthorizedFailure(super.message);
}

class ForbiddenFailure extends BadResponseFailure {
  const ForbiddenFailure(super.message);
}

class NotFoundFailure extends BadResponseFailure {
  const NotFoundFailure(super.message);
}

class ConflictFailure extends BadResponseFailure {
  const ConflictFailure(super.message);
}

class InternalServerErrorFailure extends BadResponseFailure {
  const InternalServerErrorFailure(super.message);
}

/// Database failures
class DatabaseFailure extends Failure {
  @override
  final String message;
  const DatabaseFailure(this.message) : super();
}

/// Generic / unknown failure
class UnknownFailure extends Failure {
  @override
  final String message;
  const UnknownFailure(this.message) : super();
}
