import '../../../core/common/view_model/base_view_model.dart';
import '../view/app_main/app_main_view.dart';

class AppMainViewModel extends BaseViewModel<AppMainViewParam> {
  AppMainViewModel(super.param);

  @override
  void closeModel() {
    dispose();
  }
}
