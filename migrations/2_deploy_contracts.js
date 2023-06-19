const BojackToken = artifacts.require("BojackToken");

module.exports = function(deployer) {
  const initialSupply = 1000000; 
  deployer.deploy(BojackToken, initialSupply);
};
