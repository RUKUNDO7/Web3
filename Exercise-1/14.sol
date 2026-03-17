// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {

    // Owner of the contract
    address public owner;

    // Candidate structure
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // List of candidates
    Candidate[] public candidates;

    // Mapping to track if an address has voted
    mapping(address => bool) public hasVoted;

    // Event emitted when a vote is cast
    event Voted(address voter, string candidateName);

    // Set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict functions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    // Add a candidate (only owner)
    function addCandidate(string memory name) public onlyOwner {
        candidates.push(Candidate(name, 0));
    }

    // Vote for a candidate by index
    function vote(uint256 candidateIndex) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(candidateIndex < candidates.length, "Invalid candidate index");

        candidates[candidateIndex].voteCount += 1;
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, candidates[candidateIndex].name);
    }

    // Get total number of candidates
    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }

    // Get candidate details by index
    function getCandidate(uint256 index) public view returns (string memory, uint256) {
        require(index < candidates.length, "Invalid candidate index");
        Candidate memory c = candidates[index];
        return (c.name, c.voteCount);
    }
}