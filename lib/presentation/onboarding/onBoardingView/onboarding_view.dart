import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutapp/domain/models/models.dart';
import 'package:tutapp/presentation/onboarding/onBoarding_view_model/onboarding_view_model.dart';
import 'package:tutapp/presentation/res/assets_manager.dart';
import 'package:tutapp/presentation/res/color_manager.dart';
import 'package:tutapp/presentation/res/constant_manager.dart';
import 'package:tutapp/presentation/res/route_manager.dart';
import 'package:tutapp/presentation/res/strings_manager.dart';
import 'package:tutapp/presentation/res/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  late final PageController _pageController;
  late final OnboardingViewModel _onboardingViewModel;
  void _bind() {
    _onboardingViewModel.start();
  }

  @override
  void initState() {
    _onboardingViewModel = OnboardingViewModel();
    _pageController = PageController();
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderView>(
        stream: _onboardingViewModel.outputSliderView,
        builder: (context, snapshot) =>
            getContentWidget(sliderView: snapshot.data));
  }

  Widget getContentWidget({required SliderView? sliderView}) {
    if (sliderView == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderView.numberOfSlids,
            onPageChanged: (index) => _onboardingViewModel.onPageChanged(index),
            itemBuilder: (context, index) {
              return OnBoardingPage(
                sliderView.slider,
              );
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteManager.loginRoute);
                  },
                  child: Text(
                    StringsManager.skip,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),

              // widgets indicator and arrows
              _getBottomSheetWidget(sliderView: sliderView),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget({required SliderView sliderView}) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(_onboardingViewModel.goPrevious(),
                    duration: const Duration(
                        milliseconds: ConstantManager.sliderAnimationTime),
                    curve: Curves.easeInOut);
              },
            ),
          )

// circle indicator

          // right arrow
          ,
          Row(
            children: [
              for (int i = 0; i < sliderView.numberOfSlids; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(
                    i,
                    sliderView.currentIndex,
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                child: SizedBox(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.rightArrowIc),
                ),
                onTap: () {
                  // go to previous slide
                  _pageController.animateToPage(_onboardingViewModel.goNext(),
                      duration: const Duration(
                          milliseconds: ConstantManager.sliderAnimationTime),
                      curve: Curves.bounceInOut);
                }),
          )
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _onboardingViewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderModel _sliderModel;

  const OnBoardingPage(this._sliderModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderModel.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderModel.supTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderModel.image)
      ],
    );
  }
}
