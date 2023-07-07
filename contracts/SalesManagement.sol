// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract SalesManagement {
    struct Item {
        string name;
        uint price;
    }

    mapping(uint => Item) public items;
    mapping(uint => Item) public sales;

    uint public revenue;
    uint public collection;

    address public owner;
    address public employee;

    constructor(address _owner, address _employee) {
        owner = _owner;
        employee = _employee;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier onlyEmployee() {
        require(msg.sender == employee, "Only the employee can call this function");
        _;
    }

    function addItem(uint _id, string memory _name, uint _price) public onlyOwner {
        items[_id] = Item(_name, _price);
    }

    function makeSales(uint _id) public onlyEmployee {
        Item storage item = items[_id];
        require(bytes(item.name).length > 0, "Item is not in the inventory");
        sales[_id] = Item(item.name, item.price);
        revenue += item.price;
    }

    function withdrawRevenue() public onlyOwner {
        require(revenue > 0, "No revenue to withdraw");
        collection += revenue;
        revenue = 0;
    }

    function getItemSales(uint _id) public view returns (uint, string memory, uint) {
        Item memory item = sales[_id];
        require(bytes(item.name).length > 0, "Item sales not found");
        return (_id, item.name, item.price);
    }

    function getTotalCollection() public view returns (uint) {
        return collection;
    }
}
