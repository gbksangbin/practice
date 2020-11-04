/*1번 문제
for(let i=1;i<=12;i++){
    console.log(`${i}월`);
}*/

/*2번 문제
for(let i=1;i<=12;i++){
    if(i%2 === 0){
        console.log(`${i}월`);
    }
}*/

/*3번 문제
let inport_number=Number(prompt("숫자를 입력 하세요."));
let number1=0;
let number2=1;
let fibonacci=0;
for(;;){
fibonacci=number1+number2;
number1=number2;
number2=fibonacci;
console.log(fibonacci);
    if(fibonacci>inport_number){
        break;
    }
}*/

/*4번 문제
const FIXED_COST=Number (prompt("고정값을 입력하세요."));
const VARIABLE_COST=Number(prompt("가변값을 입력하세요."));
const SALES_COST=Number(prompt("판매값을 입력하세요."));

let manufactureCount =0;

alert(FIXED_COST/(SALES_COST-VARIABLE_COST));

while(true){
    if(FIXED_COST+VARIABLE_COST*manufactureCount<SALES_COST*manufactureCount){
        break;
    }
    manufactureCount++;
}
alert(manufactureCount);*/

/*5번 문제
let suger_kg=Number(prompt('설탕의 킬로그램을 입력하시오.'));
let bag=suger_kg/5;
let leftover=suger_kg%5;
bag+=(leftover/3);
leftover=leftover%3;
if(leftover%3!==0){
  bag+=1;  
}
alert(bag);*/
