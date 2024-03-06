abstract class RepositoryError {}

class NoPermissionRepositoryError implements RepositoryError {}

class BadHttpResponseRepositoryError implements RepositoryError {}

class UnknownRepositoryError extends RepositoryError {}
