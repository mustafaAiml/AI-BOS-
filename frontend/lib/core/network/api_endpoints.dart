class ApiEndpoints {
  ApiEndpoints._();

  // Core Authentication Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String me = '/users/me';

  // Workspace Setup Endpoints (Personal Space)
  static const String workspace = '/workspace';
}
