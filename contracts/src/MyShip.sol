pragma solidity ^0.8;

import './Ship.sol';
import 'hardhat/console.sol';

contract MyShip is Ship{
    
  uint xShip; 
  uint yShip;
  
  

  function update(uint x, uint y) public virtual override{
    xShip=x;
    yShip=y;

  }

  function random(uint number) public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  
        msg.sender))) % number;
  }

  function fire() public virtual override returns (uint, uint)  {
   
   uint choice = random(2);

   //tirer de manière randomisé par rapport à la position 
   if(choice==0){
    uint xShot = random(xShip);
    uint yShot=random(yShip);
    return (xShot,yShot); 
   }
   else{
    //on tire en inversant les coordonnées.
    return (yShip,xShip);
   }
  }

  function place(uint width, uint height) public virtual override returns (uint, uint) {
        // placer les bateaux de manière aléatoire en ne pas dépassant les cases
        xShip=random(width);
        yShip=random(height);
        return (xShip,yShip);
  }


}