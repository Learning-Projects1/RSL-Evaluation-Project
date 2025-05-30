import 'package:intl/intl.dart';

String dateTimeFormatter(String raw) {
  try {
    final parsed = DateTime.parse(raw);
    final formatted = DateFormat('dd MMM yyyy hh:mm a').format(parsed);
    return formatted;
  } catch (e) {
    return raw;
  }
}
