// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "authenticationError":
            MessageLookupByLibrary.simpleMessage("Authentication Error"),
        "checkYourEmail":
            MessageLookupByLibrary.simpleMessage("Check your email"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "continues": MessageLookupByLibrary.simpleMessage("Continue"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enterConfirmPassword": MessageLookupByLibrary.simpleMessage(
            "Please enter your password again"),
        "enterEmailForget": MessageLookupByLibrary.simpleMessage(
            "Enter your email address and we will send you a link to reset your password."),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("Please enter your password"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("Please enter a valid email"),
        "enterYourEmail":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "enterYourPassword":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "or": MessageLookupByLibrary.simpleMessage("or"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordsDontMatch":
            MessageLookupByLibrary.simpleMessage("Passwords don\'t match"),
        "reEnterYourPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter your password"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember Me"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Send Email"),
        "sendResetLink": MessageLookupByLibrary.simpleMessage("Send Reset Link")
      };
}
