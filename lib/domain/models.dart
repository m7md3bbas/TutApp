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
