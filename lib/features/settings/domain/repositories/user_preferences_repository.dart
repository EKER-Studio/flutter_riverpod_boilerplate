import '../entities/user_preferences.dart';

/// Repository interface for managing user preferences.
abstract class UserPreferencesRepository {
  /// Watches the user preferences.
  Stream<UserPreferences> watch();

  /// Gets the current user preferences.
  Future<UserPreferences> get();

  /// Updates the theme mode.
  Future<void> updateThemeMode(UserThemeMode themeMode);

  /// Updates whether notifications are enabled.
  Future<void> updateNotificationsEnabled(bool isEnabled);
}
