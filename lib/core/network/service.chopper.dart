// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$NetworkService extends NetworkService {
  _$NetworkService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = NetworkService;

  @override
  Future<Response<dynamic>> getSupportedCurrencies() {
    final Uri $url = Uri.parse('v1/currencies');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLatestRates(
    String from,
    List<String> to,
  ) {
    final Uri $url = Uri.parse('v1/latest');
    final Map<String, dynamic> $params = <String, dynamic>{
      'base_currency': from,
      'currencies': to,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
