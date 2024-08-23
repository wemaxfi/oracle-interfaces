// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

// import {IOracle} from "./IOracle.sol";

interface IPriceOracle {
    struct UnderlyingToken {
        uint128 oracleDecimal; // oracle decimal: 8, 18, ...
        uint128 tokenDecimal; // token decimal: 8, 18, ...
    }

    /* PriceOracle Functions */

    function setOracle(
        bytes32 symbol,
        address,
        uint128 oracleDecimal,
        uint128 tokenDecimal
    ) external;
}
