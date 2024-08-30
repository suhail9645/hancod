// Model class for Service
class ServiceModel {
  final int id;
  final String serviceName;
  final double rating;
   int orderCount;
  final String duration;
  final String image;
  final double price;

  // Constructor
  ServiceModel({
    required this.id,
    required this.serviceName,
    required this.rating,
    required this.orderCount,
    required this.duration,
    required this.image,
    required this.price,
  });

  // Factory constructor to create an instance from a map (JSON)
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      serviceName: json['serviceName'],
      rating: json['rating'].toDouble(),
      orderCount: json['orderCount'],
      duration: json['duration'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }

  // Static method to convert a list of maps to a list of Service models
  static List<ServiceModel> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => ServiceModel.fromJson(json)).toList();
  }
}
