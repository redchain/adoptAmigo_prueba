class Customer {
  final String nombre;
  final String apellido;
  final String email;
  final String edad;

  Customer({
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nombre': nombre,
      'apellido': apellido,
      'email': email,
      'edad': edad,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      nombre: map['nombre'] as String,
      apellido: map['apellido'] as String,
      email: map['email'] as String,
      edad: map['edad'] as String,
    );
  }
}
