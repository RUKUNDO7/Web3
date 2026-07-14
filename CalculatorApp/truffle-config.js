module.exports = {
  networks: {
    // Local Ganache network
    development: {
      host: "127.0.0.1",
      port: 7545,         // Ganache GUI default port (use 8545 for ganache-cli)
      network_id: "*",    // Match any network id
    },
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.19",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
  },
};
