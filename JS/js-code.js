"use strict";
//이코드는 알릶창을 띄웁니다.
alert('Hello, World!');

const PG_FEE=0.03;

let a=10;
let b=3;
let c=`sad`;

let price = 20_0000;
let pg_fee = price*PG_FEE;

alert(`${typeof a},${typeof b},${typeof c},${typeof (a+b)}`);
let result = prompt("사랑해요", ["기본값"]);
alert(result);

let isboss = confirm("당신이 주인인가요?");
alert(isboss);

