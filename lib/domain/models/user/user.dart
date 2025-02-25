import 'package:car_ticket/domain/entities/user/user_entity.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? photoUrl;
  final String? phone;
  final String? role;
  final DateTime? createdAt;

  const MyUser({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
    this.phone,
    this.role,
    this.createdAt,
  });

  static MyUser empty = const MyUser(id: '', email: '', name: '', photoUrl: '');

  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
    String? phone,
    String? role,
    DateTime? createdAt,
  }) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(id: id, email: email, name: name, photoUrl: photoUrl);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        id: entity.id, email: entity.email, name: entity.name, photoUrl: null, phone: null, role: null, createdAt: null);
  }

  factory MyUser.fromDocument(Map<String, dynamic> data) {
    return MyUser(
      id: data['id'],
      email: data['email'],
      name: data['name'],
      photoUrl: data['photoUrl'],
      phone: data['phone'],
      role: data['role'],
      createdAt: data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'phone': phone,
      'role': role,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, email, name, photoUrl, phone, role, createdAt];
}
