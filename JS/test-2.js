//블랙잭 게입 
"use strict";
const TARGET_NUMBER=21;
 
let total_number=0;
 for(;;){
    let my_card= prompt("자신의 카드 값을 입력 하시오.");
    total_number+=Number(my_card);
    alert(total_number);
    if(total_number===TARGET_NUMBER){
        alert("승리하였습니다.");
        break;
    }else if(total_number<TARGET_NUMBER){
        alert("다시 반복합니다.");
    }else if(total_number>TARGET_NUMBER){
        alert("실패하셨습니다.");
        break;
    }
 }