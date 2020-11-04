let year =prompt("년도를 입력하세요.");
if(year%4===0&&year%100!==0){
    console.log(1);
}else if(year%400===0){
    console.log(1);
}else{
    console.log(0);
}