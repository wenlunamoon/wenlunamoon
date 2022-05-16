import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'web3_wallet.dart';

final _walletWalletConnect = ChangeNotifierProvider<WalletWalletConnect>(
  (ref) => WalletWalletConnect(operatingChain: 56),
);

class WalletWalletConnect extends Web3Wallet {
  WalletWalletConnect({required super.operatingChain});

  static ChangeNotifierProvider<WalletWalletConnect> get instance =>
      _walletWalletConnect;

  final _walletconnect = WalletConnectProvider.binance();
  String _currentAddress = "";

  @override
  void connect() async {
    await _walletconnect.connect();
    notifyListeners();
  }

  @override
  Future<String> currentAddress() async {
    return _currentAddress;
  }

  @override
  Future<int> currentChain() async {
    return int.parse(_walletconnect.chainId);
  }

  @override
  void disconnect() async {
    if (isEnabled()) {
      _currentAddress = "";
      notifyListeners();
    }
  }

  @override
  void initialize(BuildContext context) {
    if (!isEnabled()) {
      return;
    }
    _walletconnect.onConnect(() {
      notifyListeners();
    });
    _walletconnect.onDisconnect((_, __) {
      notifyListeners();
    });
    _walletconnect.onAccountsChanged((_) {
      notifyListeners();
    });
    _walletconnect.onChainChanged((_) {
      notifyListeners();
    });
  }

  @override
  bool isConnected() {
    return _walletconnect.connected;
  }

  @override
  bool isEnabled() {
    return true;
  }

  @override
  Future<bool> isInOperatingChain() async {
    return await currentChain() == super.operatingChain;
  }

  @override
  Future<bool> callContract(String address, String abi, BigInt value,
      {List<Object> args = const []}) async {
    return false;
  }

  @override
  Future<bool> sendTransaction(String to, BigInt value) async {
    if (!isConnected()) {
      return false;
    }
    try {
      await Web3Provider.fromWalletConnect(_walletconnect)
          .getSigner()
          .sendTransaction(
            TransactionRequest(
              to: to,
              value: value,
            ),
          );
      return true;
    } catch (exception) {
      debugPrint(exception.toString());
    }
    return false;
  }
}
