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
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliderList = _getSliderData();
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  // TODO: implement inputSliderView
  Sink get inputSliderView => _streamController.sink;

  @override
  Stream<SliderView> get outputSliderView =>
      _streamController.stream.map((sliderView) => sliderView);

  //methods
  List<SliderModel> _getSliderData() => [
        SliderModel(
            title: StringsManager.onBoardingTitle1,
            supTitle: StringsManager.onBoardingSubTitle1,
            image: Imagemanager.onBoardingLogo1),
        SliderModel(
            title: StringsManager.onBoardingTitle2,
            supTitle: StringsManager.onBoardingSubTitle2,
            image: Imagemanager.onBoardingLogo2),
        SliderModel(
            title: StringsManager.onBoardingTitle3,
            supTitle: StringsManager.onBoardingSubTitle3,
            image: Imagemanager.onBoardingLogo3),
        SliderModel(
            title: StringsManager.onBoardingTitle4,
            supTitle: StringsManager.onBoardingSubTitle4,
            image: Imagemanager.onBoardingLogo4),
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
