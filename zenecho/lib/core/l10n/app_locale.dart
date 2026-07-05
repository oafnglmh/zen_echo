import 'app_strings.dart';
import 'strings_en.dart';
import 'strings_vi.dart';

class AppLocale {
  AppLocale._();

  static AppStrings _current = const StringsEn();

  static AppStrings get current => _current;

  static void setLocale(String languageCode) {
    _current = languageCode == 'vi' ? const StringsVi() : const StringsEn();
  }
}
