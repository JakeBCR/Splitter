pragma solidity 0.4.19;

contract Splitter {
    
    mapping(address => uint) public balances;
    
    event LogSplitFunds(address sender, uint amount);
    event LogSetAddresses(address sender, address bob, address carol);
    event LogWithdraw(msg.sender, withdrawBalance);
    
    function splitFunds(address receiver1, address receiver2) public payable {
        
        require(msg.value > 0 );
        uint half = msg.value / 2;        
        
        balances[receiver1] += half;
        balances[receiver2] += half;
                
        uint remainder = msg.value % 2;
        
        if (remainder > 0 ) {
            msg.sender.transfer(1);
        }  
        
    }
    
    function withdrawFunds(uint withdrawBalance) public payable {
        
        require(withdrawBalance != 0 );
        require(withdrawBalance >= balances[msg.sender]);
        balances[msg.sender] -= withdrawBalance;
        withdrawBalance == 0;
        msg.sender.transfer(withdrawBalance);
        
    }

    

        
    }

