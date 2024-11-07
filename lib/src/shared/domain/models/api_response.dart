import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  const ApiResponse({
    this.status,
    this.data,
    this.message,
  });

  final String? status;
  final T? data;
  final String? message;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json["status"],
        data: json["data"],
        message: json["message"],
      );

  @override
  List<Object?> get props => [
        status,
        data,
        message,
      ];
}
