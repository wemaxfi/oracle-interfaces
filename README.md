# Price Oracle

This project demonstrates how to interact with a price oracle smart contract to set and retrieve token prices.

### Update the script

Replace `<ORACLE_API>` and `<CONTRACT_ADDRESS>` in the script with your actual API URL and contract address.

---

# Oracle Interface

### `IOracle`
- **`setUnderlyingPrice(bytes32 symbol, Data memory data, bytes calldata signature)`**: Sets the underlying price for a token.
- **`isOutdated(bytes32 symbol) view returns (bool)`**: Checks if the token's price data is outdated.
- **`getUnderlyingPrice(bytes32 symbol) view returns (uint256 price)`**: Retrieves the token's price, considering if it's outdated.
- **`getUnderlyingPriceEvenIfOutdated(bytes32 symbol) view returns (uint256 price)`**: Retrieves the token's price without checking if it's outdated.

### `IPriceOracle`
- **`setOracle(bytes32 symbol, address, uint128 oracleDecimal, uint128 tokenDecimal)`**: Sets the oracle for a specific token.
