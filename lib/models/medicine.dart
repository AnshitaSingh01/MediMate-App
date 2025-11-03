class Medicine {
  final String id;
  final String name;
  final String dose;
  final String time;
  final String notes;

  Medicine({
    required this.id,
    required this.name,
    required this.dose,
    required this.time,
    required this.notes,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      dose: json['dose'] ?? '',
      time: json['time'] ?? '',
      notes: json['notes'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dose': dose,
      'time': time,
      'notes': notes,
    };
  }
}
