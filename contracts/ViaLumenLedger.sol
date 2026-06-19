// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title ViaLumenLedger — on-chain knowledge ledger (Sepolia paymaster lab base)
/// @notice Append-only log (Nothing is Deleted). Foundation for the Paymaster lab:
///         a target contract whose calls can be gas-sponsored via ERC-4337.
contract ViaLumenLedger {
    struct Entry { address author; uint256 time; string note; }
    Entry[] public entries;
    event Logged(uint256 indexed id, address indexed author, string note);

    /// @notice append a knowledge entry — never overwritten, never deleted
    function log(string calldata note) external returns (uint256 id) {
        id = entries.length;
        entries.push(Entry(msg.sender, block.timestamp, note));
        emit Logged(id, msg.sender, note);
    }

    function count() external view returns (uint256) { return entries.length; }
}
