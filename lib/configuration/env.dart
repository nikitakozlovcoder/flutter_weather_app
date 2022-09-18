import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
    @EnviedField(varName: 'openweathermapkey')
    static const openweathermapkey = _Env.openweathermapkey;
}