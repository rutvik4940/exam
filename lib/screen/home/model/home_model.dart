class ProductModel
{
  int?id;
  num?price;
  String?title,description,category,image;
  RatingModel? ratingModel;
  ProductModel(
      {this.title, this.id, this.description, this.image, this.price, this.category, this.ratingModel,});
  factory ProductModel.mapToModel(Map m1)
  {
    return ProductModel(id: m1['id'],image: m1['image'],title: m1['title'],description: m1['description:'],price: m1['price'],category: m1['category'],ratingModel: RatingModel.mapToModel(m1['rating']));
  }

}
class RatingModel
{
  num?rate;
  int?count;
  RatingModel({this.rate,this.count});
  factory RatingModel.mapToModel(Map m1)
  {
    return RatingModel(rate: m1['rate'],count: m1['count']);
  }
}