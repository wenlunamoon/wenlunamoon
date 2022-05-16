import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'web3_wallet.dart';

final _walletMetaMask = ChangeNotifierProvider<WalletMetaMask>(
  (ref) => WalletMetaMask(operatingChain: 56),
);

class WalletMetaMask extends Web3Wallet {
  WalletMetaMask({required super.operatingChain});

  static ChangeNotifierProvider<WalletMetaMask> get instance => _walletMetaMask;

  String _currentAddress = "";

  @override
  void connect() async {
    if (isEnabled()) {
      final accounts = await ethereum!.requestAccount();
      if (accounts.isNotEmpty) _currentAddress = accounts.first;
      notifyListeners();
    }
  }

  @override
  Future<String> currentAddress() async {
    return _currentAddress;
  }

  @override
  Future<int> currentChain() async {
    return await ethereum?.getChainId() ?? -1;
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
    ethereum?.onDisconnect((error) {
      notifyListeners();
      Navigator.of(context).pushNamed('/logout');
    });
    ethereum?.onAccountsChanged((accounts) {
      _currentAddress = accounts.first;
      notifyListeners();
    });
  }

  @override
  bool isConnected() {
    final ethereumConnected = ethereum?.isConnected() ?? false;
    final hasAccount = _currentAddress.isNotEmpty;
    return ethereumConnected && hasAccount;
  }

  @override
  bool isEnabled() {
    return ethereum != null;
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
      await provider!.getSigner().sendTransaction(
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
