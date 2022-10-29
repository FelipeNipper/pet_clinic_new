class Type {
  final String id;
  final String name;

  const Type({required this.id, required this.name});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(id: json['id'] as String? ?? '', name: json['name'] as String? ?? '');
  }
}
