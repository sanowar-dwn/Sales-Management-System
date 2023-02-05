//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract Sales_Mangement_System{
struct Item{
    uint id;
    string name;
    uint price;
}

mapping(uint => Item) public items;
mapping(uint => Item) public sales;

uint public revenue;
uint collection;

address public owner;
address public employee;

uint public currentTime = block.timestamp;
uint public contract_balance = address(this).balance;

constructor(address _owner, address _employee){
    owner = _owner;
    employee = _employee;
}

function addItem(uint _id, string memory _name, uint _price) public{
    require(msg.sender == owner, "You are not the onwer");
    items[_id] = Item(_id,_name,_price);
}

function makeSales(uint _id) public{
    require(msg.sender == employee, "You are not the employee!");
    require(items[_id].id !=0, "Item is not in the inventory!");
    Item memory item = items[_id];
    sales[_id] = Item(item.id,item.name,item.price);
    revenue = revenue + item.price;
    }

    function withdrawRevenue() public {
    require(msg.sender == owner, "You are not the onwer");
    collection = collection + revenue;
    revenue = 0;
    currentTime = block.timestamp;
    }

    function getItemSales(uint _id) public view returns(uint, string
    memory, uint){

    Item memory item = sales[_id];
    return(item.id,item.name,item.price);
    }

    function getTotalCollection() public view returns(uint){
    return collection;
    }

}
    