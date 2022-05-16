import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'web3_meta_mask.dart';

import 'web3_wallet_connect.dart';

abstract class Web3Wallet extends ChangeNotifier {
  Web3Wallet({required this.operatingChain});

  static bool useWalletConnect = false;

  static ChangeNotifierProvider<Web3Wallet> get instance =>
      useWalletConnect ? WalletWalletConnect.instance : WalletMetaMask.instance;

  final int operatingChain;

  bool isEnabled();

  Future<bool> isInOperatingChain();

  bool isConnected();

  Future<String> currentAddress();

  Future<int> currentChain();

  void initialize(BuildContext context);

  void connect();

  void disconnect();

  Future<bool> sendTransaction(String to, BigInt value);

  Future<bool> callContract(String address, String abi, BigInt value,
      {List<Object> args = const []});
}
