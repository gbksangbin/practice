"use strict";

 const ID="gbksangbin";
 const PASSWORD="g1234";

let ENTER_ID = prompt('아이디',["아이디를 입력하세요."]);
let ENTER_PASSWORD = prompt('비밀 번호',"아이디를 입력하세요.");

if(ENTER_ID===ID && ENTER_PASSWORD===PASSWORD){
    alert("로그인이 되었습니다.");
}
else{
    alert("존재하지 않는 아이디거나 비밀번호가 틀렸습니다.");
}