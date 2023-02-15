const XYZCoin = artifacts.require("XYZCoin");

module.exports = function(deployer) {
    deployer.deploy(XYZCoin,"0xebE80F145CeB61344eC79E4fc6c9A2B9136CD61A");
}