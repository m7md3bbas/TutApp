import 'dart:async';

import 'package:tutapp/domain/models.dart';
import 'package:tutapp/presentation/base/base_view_model.dart';
import 'package:tutapp/presentation/res/assets_manager.dart';
import 'package:tutapp/presentation/res/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingInput, OnboardingOutput {
  //streams

  final StreamController _streamController = StreamController<SliderView>();
  late final List<SliderModel> _sliderList;
  int _currentIndex = 0;
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliderList = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _sliderList.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _sliderList.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderView
  Sink get inputSliderView => _streamController.sink;

  @override
  Stream<SliderView> get outputSliderView =>
      _streamController.stream.map((sliderView) => sliderView);

  // private methods
  void _postDataToView() {
    inputSliderView.add(SliderView(
        slider: _sliderList[_currentIndex],
        numberOfSlids: _sliderList.length,
        currentIndex: _currentIndex));
  }

  List<SliderModel> _getSliderData() => [
        SliderModel(
            title: StringsManager.onBoardingTitle1,
            supTitle: StringsManager.onBoardingSubTitle1,
            image: ImageAssets.onboardingLogo1),
        SliderModel(
            title: StringsManager.onBoardingTitle2,
            supTitle: StringsManager.onBoardingSubTitle2,
            image: ImageAssets.onboardingLogo2),
        SliderModel(
            title: StringsManager.onBoardingTitle3,
            supTitle: StringsManager.onBoardingSubTitle3,
            image: ImageAssets.onboardingLogo3),
        SliderModel(
            title: StringsManager.onBoardingTitle4,
            supTitle: StringsManager.onBoardingSubTitle4,
            image: ImageAssets.onboardingLogo4),
      ];
}

abstract mixin class OnboardingInput {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);
  Sink get inputSliderView;
}

abstract mixin class OnboardingOutput {
  Stream<SliderView> get outputSliderView;
}
