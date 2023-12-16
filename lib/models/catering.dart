class Catering {
  final String name;
  final String harga;
  final String description;
  final String imageAsset;
  final List<String> imageUrls;
  bool isFavorite;

  Catering({
    required this.name,
    required this.harga,
    required this.description,
    required this.imageAsset,
    required this.imageUrls,
    this.isFavorite = false,
  });

}