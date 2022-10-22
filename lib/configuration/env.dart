import 'package:envied/envied.dart';
import 'package:injectable/injectable.dart';

part 'env.g.dart';

@Envied(path: '.env')
@Singleton()
class Env {
    @EnviedField(varName: 'openweathermapkey')
    final openweathermapkey = _Env.openweathermapkey;
}


