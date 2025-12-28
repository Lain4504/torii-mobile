/// Course model
class Course {
  Course({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    required this.published,
  });

  final int id;
  final String title;
  final String? description;
  final double price;
  final bool published;

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      published: json['published'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'published': published,
    };
  }
}

/// Input for creating a course
class CreateCourseInput {
  CreateCourseInput({
    required this.title,
    this.description,
    required this.price,
    required this.published,
  });

  final String title;
  final String? description;
  final double price;
  final bool published;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'published': published,
    };
  }
}

/// Input for updating a course
class UpdateCourseInput {
  UpdateCourseInput({
    required this.title,
    this.description,
    required this.price,
    required this.published,
  });

  final String title;
  final String? description;
  final double price;
  final bool published;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'published': published,
    };
  }
}


