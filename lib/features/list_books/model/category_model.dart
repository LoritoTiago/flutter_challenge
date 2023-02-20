class CategoryModel {
  final String title;
  final int id;
  bool selected;

  CategoryModel({required this.id, this.selected = false, required this.title});
}
