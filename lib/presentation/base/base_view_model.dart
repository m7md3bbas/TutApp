abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  //shared variables and functions that will be used in all view models
}

abstract class BaseViewModelInputs {
  //events that will trigger the view model actions
  void start();
  void dispose();
}

abstract mixin class BaseViewModelOutputs {
  //used to expose the state to the view
}
