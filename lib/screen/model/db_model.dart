class DbModel
{
  String? category,date,time,price,rate;
  int? id;

  DbModel(
      {this.category, this.date, this.time, this.price, this.rate, this.id,});
  factory DbModel.mapToModel(Map m1)
  {
    return DbModel(date:m1['date'],id:m1['id'],time:m1['time'],category:m1['category'],price:m1['price'],rate:m1['rate']);
  }
}