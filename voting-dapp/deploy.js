const { ethers } = require('ethers');
const fs = require('fs');

const mnemonic = "current excite three session clever arrow step quick right height salt rather";
const providerUrl = "https://eth-sepolia.g.alchemy.com/v2/QCWXCbmKODDphzOy_Beue";

async function deploy() {
  const provider = new ethers.JsonRpcProvider(providerUrl);
  const wallet = ethers.Wallet.fromPhrase(mnemonic).connect(provider);

  console.log("Deploying from:", wallet.address);

  const artifact = JSON.parse(
    fs.readFileSync('./build/contracts/Voting.json', 'utf8')
  );

  const factory = new ethers.ContractFactory(
    artifact.abi,
    artifact.bytecode,
    wallet
  );

  console.log("Deploying contract...");
  const contract = await factory.deploy({
    gasLimit: 4500000,
    gasPrice: ethers.parseUnits('20', 'gwei')
  });

  console.log("Transaction hash:", contract.deploymentTransaction().hash);
  console.log("Waiting for confirmation...");
  
  await contract.waitForDeployment();
  console.log("Contract deployed at:", await contract.getAddress());
}

deploy().catch(console.error);
