const contractAddress = "0xEb0Ac20DCEBfBeeE4a57681394bDff49af0a3ae4";
const contractABI = [
  {
    "inputs": [],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "candidateId",
        "type": "uint256"
      }
    ],
    "name": "votedEvent",
    "type": "event"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "candidates",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "id",
        "type": "uint256"
      },
      {
        "internalType": "string",
        "name": "name",
        "type": "string"
      },
      {
        "internalType": "uint256",
        "name": "voteCount",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "candidatesCount",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_candidateId",
        "type": "uint256"
      }
    ],
    "name": "vote",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "name": "voters",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
];

let web3;
let votingContract;
let account;

async function connectMetaMask() {
  if (typeof window.ethereum !== 'undefined') {
    try {
      await window.ethereum.request({ method: 'eth_requestAccounts' });
      web3 = new Web3(window.ethereum);
      const accounts = await web3.eth.getAccounts();
      account = accounts[0];
      document.getElementById('account').innerText = 'Connected: ' + account;
      votingContract = new web3.eth.Contract(contractABI, contractAddress);
      loadCandidates();
    } catch (err) {
      console.error("Failed to connect MetaMask:", err);
    }
  } else {
    alert("MetaMask not detected!");
  }
}

async function loadCandidates() {
  try {
    const count = await votingContract.methods.candidatesCount().call();
    const list = document.getElementById('candidates');
    list.innerHTML = '';
    for (let i = 1; i <= count; i++) {
      const candidate = await votingContract.methods.candidates(i).call();
      const li = document.createElement('li');
      li.innerHTML = '<span>' + candidate.name + ' — ' + candidate.voteCount + ' votes</span>';
      const button = document.createElement('button');
      button.innerText = 'Vote';
      button.onclick = () => castVote(i);
      li.appendChild(button);
      list.appendChild(li);
    }
  } catch (err) {
    console.error("Error loading candidates:", err);
  }
}

async function castVote(candidateId) {
  try {
    await votingContract.methods.vote(candidateId).send({ from: account });
    alert("Vote successfully cast!");
    loadCandidates();
  } catch (err) {
    console.error("Error casting vote:", err);
    alert("Transaction failed or already voted.");
  }
}