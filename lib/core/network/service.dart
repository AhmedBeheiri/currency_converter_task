import 'package:chopper/chopper.dart';
import 'package:currency_converter_task/env/env.dart';

part 'service.chopper.dart';

@ChopperApi()
abstract class NetworkService extends ChopperService {
  static NetworkService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://api.freecurrencyapi.com/'),
      services: [_$NetworkService()],
      interceptors: [
        const HeadersInterceptor({
          'Content-Type': 'application/json',
          'apikey': Env.apiKey
        }),
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
    );
    return _$NetworkService(client);
  }

  @Get(path: 'v1/currencies')
  Future<Response> getSupportedCurrencies();

  @Get(path: 'v1/latest')
  Future<Response> getLatestRates(@Query('currencies') List<String> currencies);

}
