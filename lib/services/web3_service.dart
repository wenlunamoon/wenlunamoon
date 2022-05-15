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
        "0x55A8E06678636645D32f367522C029af4E040b9a",
        _buyAbi,
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

const _buyAbi = '''
[
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_treasury",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "_token",
          "type": "address"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "constructor"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "previousOwner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "OwnershipTransferred",
      "type": "event"
    },
    {
      "inputs": [],
      "name": "buy",
      "outputs": [],
      "stateMutability": "payable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_treasury",
          "type": "address"
        }
      ],
      "name": "changeTreasury",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "end",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_token",
          "type": "address"
        }
      ],
      "name": "inCaseTokensGetStuck",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "open",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "owner",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "price",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "remaining",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "renounceOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "token",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "transferOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "treasury",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ]
''';
