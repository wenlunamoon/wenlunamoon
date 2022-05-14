import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _web3ClientProvider = ChangeNotifierProvider((ref) => Web3Service());

class Web3Service extends ChangeNotifier {
  static ChangeNotifierProvider<Web3Service> get instance =>
      _web3ClientProvider;

  final _operatingChain = 56;

  bool get isEnabled => ethereum != null;

  bool get isInOperatingChain => currentChain == _operatingChain;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  String currentAddress = "";

  int currentChain = -1;

  initialize() {
    if (!isEnabled) {
      return;
    }
    ethereum!.onAccountsChanged((accounts) {
      clear();
      connect();
    });
    ethereum!.onChainChanged((chainId) {
      clear();
    });
    clear();
  }

  connect() async {
    if (isEnabled) {
      final accounts = await ethereum!.requestAccount();
      if (accounts.isNotEmpty) currentAddress = accounts.first;
      currentChain = await ethereum!.getChainId();
      notifyListeners();
    }
  }

  clear() async {
    currentAddress = "";
    currentChain = await ethereum!.getChainId();
    notifyListeners();
  }

  buy(BigInt value) async {
    if (!isConnected) {
      return;
    }
    try {
      final contract = Contract(
        "0x1Cf87CF9e01b4497674570BAA037844A3816B7A9",
        "",
        provider!.getSigner(),
      );
      await contract.send(
        'buy',
        [],
        TransactionOverride(value: value),
      );
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  donate(BigInt value) async {
    if (!isConnected) {
      return;
    }
    try {
      await provider!.getSigner().sendTransaction(
            TransactionRequest(
              to: "0xFb08de74D3DC381d2130e8885BdaD4e558b24145",
              value: value,
            ),
          );
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }
}
