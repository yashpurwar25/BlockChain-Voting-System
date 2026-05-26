// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockbaseVoting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    address public admin;
    mapping(uint => Candidate) public candidates; 
    mapping(address => bool) public hasVoted; // Tracks if an address has already voted
    uint public candidatesCount;
    bool public votingOpen;

    // Event to notify when a vote is cast
    event voteCast(address voter, uint candidateId);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can perform this action");
        _;
    }

    constructor() {
        admin = msg.sender;
        votingOpen = true; // Voting starts as open
    }

    /**
     * @dev Admin adds a new candidate to the ballot.
     * @param _name The name of the candidate.
     */
    function addCandidate(string memory _name) public onlyAdmin {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    /**
     * @dev Allows a user to vote for a candidate.
     * @param _candidateId The ID of the candidate to vote for.
     */
    function vote(uint _candidateId) public {
        // 1. Check if voting is still open
        require(votingOpen == true, "Voting has ended.");
        
        // 2. Check if the voter has already voted
        require(hasVoted[msg.sender] == false, "You have already cast your vote.");
        
        // 3. Check if the candidate ID is valid
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");

        // Record that the user has voted
        hasVoted[msg.sender] = true;

        // Increment the candidate's vote count
        candidates[_candidateId].voteCount++;

        // Trigger the event
        emit voteCast(msg.sender, _candidateId);
    }

    /**
     * @dev Admin can close the voting process.
     */
    function closeVoting() public onlyAdmin {
        votingOpen = false;
    }

    /**
     * @dev Admin can reopen the voting process.
     */
    function openVoting() public onlyAdmin {
        votingOpen = true;
    }

    /**
     * @dev Returns the name and vote count of a specific candidate.
     */
    function getCandidate(uint _candidateId) public view returns (string memory name, uint count) {
        Candidate storage c = candidates[_candidateId];
        return (c.name, c.voteCount);
    }
}