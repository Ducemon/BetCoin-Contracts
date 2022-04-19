require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  paths:{
    sources:"./contracts",
    tests:"./test",
    cache:"./cache",
    artifacts:"./artifacts"
  },
  networks:{
    local:{
      url: "http://localhost:8545/",
      accounts: ["0x92db14e403b83dfe3df233f83dfa3a0d7096f21ca9b0d6d6b8d88b2b4ec1564e"]
    }
  }
};
