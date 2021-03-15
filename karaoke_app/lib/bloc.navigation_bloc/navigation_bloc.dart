/* import 'package:bloc/bloc.dart';
import 'package:karaoke_app/src/pages/homepage.dart';
import 'package:karaoke_app/src/pages/myaccountpage.dart';
import 'package:karaoke_app/src/pages/myorderspage.dart';

enum NavigatioEvents {
  HomePageClickedEvent,
  AccountClickedEvent,
  OrdersClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigatioEvents, NavigationStates> {
  @override
  NavigationStates get initialState => AccountPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigatioEvents event) async* {
    switch (event) {
      case NavigatioEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigatioEvents.AccountClickedEvent:
        yield AccountPage();
        break;
      case NavigatioEvents.OrdersClickedEvent:
        yield OrderPage();
        break;
    }
  }
}
 */
