import 'package:news/models/categori_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> category = List<CategoryModel>();
  CategoryModel categoryModel;
//CategoryModel categoryModel = CategoryModel();

  //1st Categori
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'General';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60';
  category.add(categoryModel);
  //2nd Categori
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80';
  category.add(categoryModel);
  //3rd Categori
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  category.add(categoryModel);
  //4th Categori
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80';
  category.add(categoryModel);
  //5th Categori
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80';
  category.add(categoryModel);
  //6th Categori
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  category.add(categoryModel);
  //7th Categori
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80';
  category.add(categoryModel);

  return category;
}
