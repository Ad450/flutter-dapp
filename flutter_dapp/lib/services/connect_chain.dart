// This class will handle all chain related calls

// project-id  57e4dfc483fd42ca88ad0f55abc9b524
// Project-secret 4365af8768774bf09f10ce3914774672

import 'package:flutter/services.dart';
import 'package:flutter_dapp/services/constants.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

/// connect to a blockchain using the chain url
/// makes calls to the chain using the
//
// https://rinkeby.infura.io/v3/57e4dfc483fd42ca88ad0f55abc9b524
class ConnectChain {
  static final _httpClient = Client();
  late Web3Client ethClient = Web3Client(kblockchainUrl, _httpClient);

// get credentials of user
  final ethCredentials = EthPrivateKey.fromHex(kPrivateKey);

// create contract
  Future<DeployedContract> createContract() async {
    final abi = await rootBundle.loadString("./contract_abi.json");
    final contract = DeployedContract(ContractAbi.fromJson(abi, "Testing"), EthereumAddress.fromHex(kContractAddress));
    return contract;
  }
}
