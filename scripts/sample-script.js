// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Betcoin = await hre.ethers.getContractFactory("BetCoin");
  const betcoin = await Betcoin.deploy(100000);
  const Bet = await hre.ethers.getContractFactory("Bet");



  await betcoin.deployed();
  


  console.log("Betcoin deployed to:", betcoin.address);

  const bet = await Bet.deploy(1,2, betcoin.address);
  await bet.deployed();

  console.log("Bet deployed to:", bet.address);


}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
