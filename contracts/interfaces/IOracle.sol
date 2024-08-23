// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

interface IOracle {
    struct Data {
        uint32 timestamp; // UNIX TIMESTAMP
        uint32 deadline; // UNIX TIMESTAMP
        uint192 price;
    }

    /* Oracle Functions */

    /**
     * @notice set formatted underlying price of token
     * @param data symbol, price, and timestamp data
     * @param signature ECDSA signature
     */
    function setUnderlyingPrice(
        bytes32 symbol,
        Data memory data,
        bytes calldata signature // ecdsa
    ) external payable;

    /**
     * @notice check whether a token has expired or not
     * @param symbol token symbol to check
     * @return `true` if outdated, `false` if not
     */
    function isOutdated(bytes32 symbol) external view returns (bool);

    /**
     * @notice get formatted underlying price of token (outdated check)
     * @param symbol token symbol to get price
     * @return price token price
     */
    function getUnderlyingPrice(
        bytes32 symbol
    ) external view returns (uint256 price);

    /**
     * @notice get formatted underlying price of token
     * @param symbol token symbol to get price
     * @return price token price
     */
    function getUnderlyingPriceEvenIfOutdated(
        bytes32 symbol
    ) external view returns (uint256 price);
}
