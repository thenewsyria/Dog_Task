// dog_response.dart


class DogResponse {
  final String message;
  final String status;

  DogResponse({
    required this.message,
    required this.status,
  });

  factory DogResponse.fromJson(Map<String, dynamic> json) {
    return DogResponse(
      message: json['message'] as String,
      status: json['status'] as String,
    );
  }
}
