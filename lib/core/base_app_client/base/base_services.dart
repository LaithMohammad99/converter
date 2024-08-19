
import 'package:taske_bloc_converte/core/base_app_client/base_app_client.dart';
import 'package:taske_bloc_converte/injection/injection_container.dart';

abstract class BaseService {
  BaseAppClient appClient = di<BaseAppClient>();

}
