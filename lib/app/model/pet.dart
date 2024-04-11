class Pet {
  final String nombre;
  final String descripcion;
  final String especie;
  final String urlImage;
  final String idProtectora;

  Pet({
    required this.nombre,
    required this.descripcion,
    required this.especie,
    required this.urlImage,
    required this.idProtectora,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'especie': especie,
      'url_image': urlImage,
      'id_protectora': idProtectora
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      nombre: map['nombre'] as String,
      descripcion: map['descripcion'] as String,
      especie: map['especie'] as String,
      urlImage: map['url_image'] as String,
      idProtectora: map['id_protectora'] as String,
    );
  }

/*

  factory Pet.fromListMap(List<Map<String, dynamic>> map) {
    return Pet(
      nombre: map['nombre'] as String,
      descripcion: map['descripcion'] as String,
      especie: map['especie'] as String,
      urlImage: map['url_image'] as String,
      idProtectora: map['id_protectora'] as String,
    );
  }
  */

}
