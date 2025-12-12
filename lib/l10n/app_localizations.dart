import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Fast Black Tiger Parts',
      'splash_title': 'Fast Black Tiger Parts',
      'welcome': 'Welcome',
      'phone_hint': 'Enter phone number',
      'otp_hint': 'Enter OTP code',
      'home_title': 'Products',
      'cart_title': 'Cart',
      'admin_title': 'Admin',
      'add_to_cart': 'Add to cart',
      'price': 'Price',
      'stock': 'Stock',
    },
    'ar': {
      'app_title': 'فاست بلاك تايجر لقطع الغيار',
      'splash_title': 'فاست بلاك تايجر لقطع الغيار',
      'welcome': 'مرحبًا',
      'phone_hint': 'أدخل رقم الهاتف',
      'otp_hint': 'أدخل رمز التحقق',
      'home_title': 'المنتجات',
      'cart_title': 'السلة',
      'admin_title': 'الإدارة',
      'add_to_cart': 'أضف إلى السلة',
      'price': 'السعر',
      'stock': 'المخزون',
    }
  };

  String t(String key) {
    final lang = locale.languageCode;
    return _localizedValues[lang]?[key] ?? _localizedValues['en']![key] ?? key;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
