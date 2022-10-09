import 'package:envied/envied.dart';
import 'package:injectable/injectable.dart';

part 'env.g.dart';

@Envied(path: '.env')
@Injectable()
class Env {
    @EnviedField(varName: 'openweathermapkey')
    final openweathermapkey = _Env.openweathermapkey;
}


