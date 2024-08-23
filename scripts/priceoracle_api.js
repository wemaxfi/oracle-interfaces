const { ethers, upgrades } = require("hardhat");

async function getData() {
  const uri = `<ORACLE_API>`;
  // console.log(uri);
  const response = await fetch(uri);
  const data = await response.json();
  return data;
}

async function main() {
  const deployer = (await ethers.getSigners())[0];
  console.log(`Deployer: ${deployer.address}, ${await ethers.provider.getBalance(deployer.address)}`);

  let timestamp = (await ethers.provider.getBlock('latest')).timestamp;
  console.log(`current timestamp: ${timestamp}`);

  // Oracle contract
  const oracle = await ethers.getContractAt("IPriceOracle", "<CONTRACT_ADDRESS>");
  console.log(`Oracle: ${await oracle.getAddress()}`);

  // from API
  const rawDatas = await getData();
  // console.log(rawDatas[1]);
  for (let rawData of rawDatas) {
    rawData.hash = '0x' + rawData.hash;
    rawData.sig = '0x' + rawData.sig;
    // console.log(rawData);

    // Set up the data and signature for setting the price
    const symbol = rawData.hash;
    const data = {
      timestamp: rawData.ts,
      deadline: rawData.ts_deadline,
      price: rawData.price
    };
    const signature = rawData.sig;

    // Set the price using the oracle
    const txSet = await oracle.setUnderlyingPrice(symbol, data, signature);
    await txSet.wait();
    console.log(`Price set successfully: ${txSet.hash}`);

    // Get the price using the oracle
    const priceResult = await oracle.getUnderlyingPrice(symbol);
    console.log(`Retrieved price: ${priceResult}`);
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
