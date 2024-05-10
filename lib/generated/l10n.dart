// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get sendResetLink {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get sendEmail {
    return Intl.message(
      'Send Email',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordMustBeAtLeast {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordMustBeAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a link to reset your password.`
  String get enterEmailForget {
    return Intl.message(
      'Enter your email address and we will send you a link to reset your password.',
      name: 'enterEmailForget',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get enterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password again`
  String get enterConfirmPassword {
    return Intl.message(
      'Please enter your password again',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords don't match`
  String get passwordsDontMatch {
    return Intl.message(
      'Passwords don\'t match',
      name: 'passwordsDontMatch',
      desc: '',
      args: [],
    );
  }

  /// `Authentication Error`
  String get authenticationError {
    return Intl.message(
      'Authentication Error',
      name: 'authenticationError',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get checkYourEmail {
    return Intl.message(
      'Check your email',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continues {
    return Intl.message(
      'Continue',
      name: 'continues',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get reEnterYourPassword {
    return Intl.message(
      'Re-enter your password',
      name: 'reEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone`
  String get enterYourPhone {
    return Intl.message(
      'Enter your phone',
      name: 'enterYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your address`
  String get enterYourAddress {
    return Intl.message(
      'Enter your address',
      name: 'enterYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Shop Ease`
  String get shop_ease {
    return Intl.message(
      'Shop Ease',
      name: 'shop_ease',
      desc: '',
      args: [],
    );
  }

  /// `New Products`
  String get new_products {
    return Intl.message(
      'New Products',
      name: 'new_products',
      desc: '',
      args: [],
    );
  }

  /// `added to favorite`
  String get added_to_favorite {
    return Intl.message(
      'added to favorite',
      name: 'added_to_favorite',
      desc: '',
      args: [],
    );
  }

  /// `removed from favorite`
  String get removed_from_favorite {
    return Intl.message(
      'removed from favorite',
      name: 'removed_from_favorite',
      desc: '',
      args: [],
    );
  }

  /// `+ Add to Cart`
  String get add_to_cart {
    return Intl.message(
      '+ Add to Cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Item is already in the cart`
  String get item_already_in_cart {
    return Intl.message(
      'Item is already in the cart',
      name: 'item_already_in_cart',
      desc: '',
      args: [],
    );
  }

  /// `Added to cart`
  String get added_to_cart {
    return Intl.message(
      'Added to cart',
      name: 'added_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `No Products Found`
  String get no_products_found {
    return Intl.message(
      'No Products Found',
      name: 'no_products_found',
      desc: '',
      args: [],
    );
  }

  /// `Search Products`
  String get search_products {
    return Intl.message(
      'Search Products',
      name: 'search_products',
      desc: '',
      args: [],
    );
  }

  /// `Language Changed to %s , please remove item from cart and favorite and add it again to see the changes`
  String get language_changed {
    return Intl.message(
      'Language Changed to %s , please remove item from cart and favorite and add it again to see the changes',
      name: 'language_changed',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get my_account {
    return Intl.message(
      'My Account',
      name: 'my_account',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Image`
  String get please_select_image {
    return Intl.message(
      'Please Select Image',
      name: 'please_select_image',
      desc: '',
      args: [],
    );
  }

  /// `You can't access the "My Account" page because you are logged in with a method that doesn't allow data editing, such as GitHub, Google, or Twitter. Please log in with email and password to access this page.`
  String get cant_access_my_account {
    return Intl.message(
      'You can\'t access the "My Account" page because you are logged in with a method that doesn\'t allow data editing, such as GitHub, Google, or Twitter. Please log in with email and password to access this page.',
      name: 'cant_access_my_account',
      desc: '',
      args: [],
    );
  }

  /// `Profile Updated Successfully`
  String get profile_updated_successfully {
    return Intl.message(
      'Profile Updated Successfully',
      name: 'profile_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Marwan Ehab Mohamed Abed`
  String get marwan_ehab_mohamed_abed {
    return Intl.message(
      'Marwan Ehab Mohamed Abed',
      name: 'marwan_ehab_mohamed_abed',
      desc: '',
      args: [],
    );
  }

  /// `Software Engineer (Flutter Developer)`
  String get software_engineer {
    return Intl.message(
      'Software Engineer (Flutter Developer)',
      name: 'software_engineer',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get about_me {
    return Intl.message(
      'About Me',
      name: 'about_me',
      desc: '',
      args: [],
    );
  }

  /// `I am a software engineer with a passion for mobile application development. I have experience in developing mobile applications using Flutter and Dart. I am a quick learner and a team player. I am always eager to learn new technologies and improve my skills. I am looking for a challenging position in a company that will allow me to grow and develop my skills. I am a hardworking and dedicated individual who is always willing to go the extra mile to achieve the best results. I am confident that I can make a positive contribution to any team that I am a part of. I am looking forward to working with you. Thank you for your time and consideration. I look forward to hearing from you soon.`
  String get marwan_bio {
    return Intl.message(
      'I am a software engineer with a passion for mobile application development. I have experience in developing mobile applications using Flutter and Dart. I am a quick learner and a team player. I am always eager to learn new technologies and improve my skills. I am looking for a challenging position in a company that will allow me to grow and develop my skills. I am a hardworking and dedicated individual who is always willing to go the extra mile to achieve the best results. I am confident that I can make a positive contribution to any team that I am a part of. I am looking forward to working with you. Thank you for your time and consideration. I look forward to hearing from you soon.',
      name: 'marwan_bio',
      desc: '',
      args: [],
    );
  }

  /// `Flutter, Dart, Front End`
  String get flutter_dart_front_end {
    return Intl.message(
      'Flutter, Dart, Front End',
      name: 'flutter_dart_front_end',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get skills {
    return Intl.message(
      'Skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Thank you!`
  String get thank_you {
    return Intl.message(
      'Thank you!',
      name: 'thank_you',
      desc: '',
      args: [],
    );
  }

  /// `Your transaction was successful`
  String get transaction_successful {
    return Intl.message(
      'Your transaction was successful',
      name: 'transaction_successful',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get product_details {
    return Intl.message(
      'Product Details',
      name: 'product_details',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Marwan Store`
  String get marwan_store {
    return Intl.message(
      'Marwan Store',
      name: 'marwan_store',
      desc: '',
      args: [],
    );
  }

  /// `PAID`
  String get paid {
    return Intl.message(
      'PAID',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `Payment Successful`
  String get payment_successful {
    return Intl.message(
      'Payment Successful',
      name: 'payment_successful',
      desc: '',
      args: [],
    );
  }

  /// `No Items in Cart`
  String get no_items_in_cart {
    return Intl.message(
      'No Items in Cart',
      name: 'no_items_in_cart',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `No Favorites Yet`
  String get no_favorites_yet {
    return Intl.message(
      'No Favorites Yet',
      name: 'no_favorites_yet',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
