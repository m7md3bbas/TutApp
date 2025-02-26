//onBoarding model
class SliderModel {
  String title;
  String supTitle;
  String image;

  SliderModel(
      {required this.title, required this.supTitle, required this.image});
}

class SliderView {
  SliderModel slider;
  int numberOfSlids;
  int currentIndex;
  SliderView({
    required this.slider,
    required this.numberOfSlids,
    required this.currentIndex,
  });
}

//login models
class Customer {
  final String id;
  final String name;
  final num numOfNotfications;

  Customer(
      {required this.id, required this.name, required this.numOfNotfications});
}

class Contact {
  final String phone;
  final String gmail;
  final String link;

  Contact({required this.phone, required this.gmail, required this.link});
}

class Authentication {
  final Customer? customer;
  final Contact? contacts;

  Authentication({required this.customer, required this.contacts});
}
