pragma solidity >=0.7.0 <0.9.0;

contract BeachThreadsDeal
{

    //defining variables for business use case
    address public BeachTshirt;
    uint public quantityTShirts;
    address public ThreadsInc;
    uint public costofTshirt;
    bool dealStatus = false;
    string public PaymentStatus = "Pending";
    string public OrderStatus = "Pending";

    //initializing contract of Beach Tshirt Company, Create Order
    constructor(uint quantity) public
    {
        BeachTshirt = msg.sender;
        quantityTShirts = quantity;
    }

    //Status of order once the order is placed
    function offerStatusAccept() public
    {
        if ( msg.sender == BeachTshirt )
        {
            revert("Threads Inc will accept the offers!");
        }

        dealStatus = true;
        OrderStatus = "Order Complete!";
        costofTshirt = quantityTShirts*220;
    }
    
    //Payment status from Threads Inc. & changing status to done.
    function MakePaymentTshirt() public
    {
        
        if ( dealStatus == false )
        {
            if (msg.sender == BeachTshirt)
            {
                revert("Let the offer be accepted first!");
            }
            else
            {
                revert("Threads Inc can't make payment for themselves!");
            }
        }
        
        else
        {
            if ( msg.sender != BeachTshirt )
            {
                revert("Threads Inc can't make payment for themselves!");
            }
            
            PaymentStatus = "Done!";
        }
        
    }
    
    }
