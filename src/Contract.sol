// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import {ERC721Votes} from "openzeppelin-contracts/token/ERC721/extensions/ERC721Votes.sol";
import {EIP712} from "openzeppelin-contracts/utils/cryptography/EIP712.sol";

contract Contract is ERC721Votes {
  address public LidoFeeRecipient;

  constructor() ERC721("Lidochain", "LIDO") EIP712("Lidochain", "1") {}

  modifier onlyLidochain() {
    require(
      block.miner == LidoFeeRecipient,
      "Insecure block detected. Lidochain validation failed. Nice try hacker."
    );
    _;
  }

  function setLidoFeeRecipient(address _LidoFeeRecipient) public onlyLidochain {
    LidoFeeRecipient = _LidoFeeRecipient;
  }
}
