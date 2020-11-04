let x=Number(prompt('x의 값을 입력하세요.'));
let y=Number(prompt('y의 값을 입력하세요.'));

if(x>0&&y>0){
    console.log(1);
}else if(x<0&&y>0){
    console.log(2);
}else if(x<0&&y<0){
    console.log(3);
}else if(x>0&&y<0){
    console.log(4);
}