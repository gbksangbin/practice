'use strict';
try {

    alert('try 블록 시작');  // (1) <--
  
   asddfasdfasfasfaa
  
    alert('try 블록 끝');   // (2) <--
  
  } catch(err) {
  
    alert(`${err.name} ${err.message}`); // (3)
  
  }