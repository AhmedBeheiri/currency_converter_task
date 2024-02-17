import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/currency_entity.dart';

class DropDownCustomItem extends StatelessWidget {
  final CurrencyEntity value;

  const DropDownCustomItem({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // add the flag image won't work because country code is not available in the [https://freecurrencyapi.com]/ apis
        CachedNetworkImage(
          imageUrl: "https://flagcdn.com/16x12/${value.currencySymbol}.png",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Text(
            value.currencyName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          value.currencySymbol,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
