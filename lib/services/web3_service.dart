// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/chain.dart';
import '../models/chain.dart';

final _instance = ChangeNotifierProvider((ref) => Web3Service());

class Web3Service extends ChangeNotifier {
  static ChangeNotifierProvider<Web3Service> get instance => _instance;

  bool get isEnabled => ethereum != null;

  Future<bool> isConnected() async {
    final address = await selectedAddress();
    return (ethereum?.isConnected() ?? false) && address.isNotEmpty;
  }

  bool get isInSupportedChain => currentChain?.supported ?? false;

  Chain? get currentChain => chainConfig[getChainId()];

  Future<bool> isConnectedAndInSupportedChain() async {
    return await isConnected() && isInSupportedChain;
  }

  Future<bool> isConnectedAndInKnownChain() async {
    return await isConnected() && currentChain != null;
  }

  Future<bool> isConnectedButInUnknownChain() async {
    return await isConnected() && currentChain == null;
  }

  Future<String> selectedAddress() async {
    final accounts = await ethereum?.getAccounts() ?? [];
    return accounts.first;
  }

  int getChainId() {
    return int.tryParse(ethereum?.getChainId() as String) ?? -1;
  }

  Future<BigInt> getNativeTokenBalance() async =>
      getNativeTokenBalanceOf(await selectedAddress());

  Future<BigInt> getNativeTokenBalanceOf(String address) async {
    try {
      if (ethereum != null) return await provider!.getBalance(address);

      return BigInt.zero;
    } catch (error) {
      return BigInt.zero;
    }
  }

  Future<List<String>> connectToLocalProvider() async {
    try {
      if (ethereum != null) {
        return await ethereum!.requestAccount();
      }
      return [];
    } finally {
      notifyListeners();
    }
  }

  allowInteropWrapper(dynamic arg) {
    return connectToLocalProvider();
  }

  void init() {
    if (ethereum != null) {
      ethereum!.onAccountsChanged((accounts) {
        connectToLocalProvider();
      });

      ethereum!.onChainChanged((chainId) {
        window.location.reload();
      });

      ethereum!.onDisconnect((error) {
        notifyListeners();
      });
    }
  }
}
