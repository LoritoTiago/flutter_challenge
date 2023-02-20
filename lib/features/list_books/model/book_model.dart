class BookModel {
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final int star;
  final int idCategory;
  final int view;

  BookModel({
    required this.idCategory,
    required this.view,
    required this.star,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
  });
}
