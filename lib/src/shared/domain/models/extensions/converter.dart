import 'package:json_annotation/json_annotation.dart';

class MillisecondEpochConverter implements JsonConverter<DateTime?, int?> {
  const MillisecondEpochConverter();

  @override
  DateTime? fromJson(dynamic data) {
    if (data is String) {
      return DateTime.tryParse(data);
    } else if (data is int) {
      return DateTime.fromMillisecondsSinceEpoch(data);
    }
    return null;
  }

  @override
  int? toJson(DateTime? date) => date?.millisecondsSinceEpoch;
}
