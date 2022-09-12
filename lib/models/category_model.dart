class CategoryModel{
  String name;
  String id;
  String imageName;
  CategoryModel(this.name,this.id,this.imageName);

  static List<CategoryModel> categoryData(){
    return [
      CategoryModel('Sports', 'sports', 'sports.png'),
      CategoryModel('Music', 'music', 'music.png'),
      CategoryModel('Movies', 'movies', 'movies.png'),
    ];
  }
}