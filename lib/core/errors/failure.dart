/// Base class for all domain-level failures.
///
/// Subclasses represent specific categories of errors that can occur
/// during repository operations, allowing the presentation layer to
/// handle errors without depending on technical exception types.
sealed class Failure {
  const Failure(this.message);

  /// A human-readable description of the failure.
  final String message;
}

/// Failure originating from a database operation.
class DatabaseFailure extends Failure {
  /// Creates a [DatabaseFailure] with the given [message].
  const DatabaseFailure(super.message);
}

/// Failure originating from a network operation.
class NetworkFailure extends Failure {
  /// Creates a [NetworkFailure] with the given [message].
  const NetworkFailure(super.message);
}

/// Failure indicating that a requested resource was not found.
class NotFoundFailure extends Failure {
  /// Creates a [NotFoundFailure] with the given [message].
  const NotFoundFailure(super.message);
}

/// Failure when input validation fails.
class ValidationFailure extends Failure {
  /// Creates a [ValidationFailure] with the given [message].
  const ValidationFailure(super.message);
}

/// Catch-all failure for unexpected or unclassified errors.
class UnknownFailure extends Failure {
  /// Creates an [UnknownFailure] with the given [message].
  const UnknownFailure(super.message);
}
