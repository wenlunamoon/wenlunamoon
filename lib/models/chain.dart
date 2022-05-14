class Chain {
  final String name;
  final String logoAsset;
  final String blockExplorerUrl;

  //final Currency currency;
  final String? fixedSwapContractAddress;
  final List<CurrencyToken>? fixedSwapCurrency;

  CurrencyToken? get nativeToken => fixedSwapCurrency?.first;

  bool get supported =>
      fixedSwapContractAddress != null && fixedSwapCurrency != null;

  const Chain({
    required this.name,
    required this.logoAsset,
    required this.blockExplorerUrl,
    this.fixedSwapCurrency,
    this.fixedSwapContractAddress,
  });
}

class CurrencyToken {
  final String symbol;
  final String address;
  final String logoAsset;
  final int decimal;

  const CurrencyToken({
    required this.symbol,
    required this.address,
    required this.logoAsset,
    required this.decimal,
  });
}
