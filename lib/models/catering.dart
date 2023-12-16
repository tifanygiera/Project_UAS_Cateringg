class Catering {
  final String name;
  final String harga;
  final String description;
  final String type;
  final String imageAsset;
  bool isFavorite;

  Catering({
    required this.name,
    required this.harga,
    required this.description,
    required this.type,
    required this.imageAsset,
    this.isFavorite = false,
  });

}