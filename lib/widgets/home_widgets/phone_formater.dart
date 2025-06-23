import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneFormatter {
  static MaskTextInputFormatter getFormatter() {
    return MaskTextInputFormatter(
      mask: '+# (###) ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  static String formatPhone(String phone) {
    final formatter = getFormatter();
    return formatter.maskText(phone);
  }

  static String unformatPhone(String formattedPhone) {
    return formattedPhone.replaceAll(RegExp(r'[^0-9]'), '');
  }
}