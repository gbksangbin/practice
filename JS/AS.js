function submint() {
    const name = document.getElementById("inputName").value;
    if (2 > name.length || name.length > 10) {
            alert("이름은 2~10 글자 사이어야만합니다.")
            return false;
        }

    const email = document.getElementById("inputEmail").value;
    if (!email.includes("@") || email.indexOf("@") !== email.lastIndexOf("@")){
       alert("이메일의 형식이 아닙니다.");

        return false;
    }

    const title = document.getElementById("inputTitle").value;
    if (!(title.includes("[") && title.includes("]"))) {
        alert("[분류] 제목명과 같은 포멧으로 작성해야 합니다.");
    
        return false;
    }

    const explanation = document.getElementById("inputExplan").value;
    if ( explanation.length > 100){
        alert("설명은 100글자까지 입니다.");
        return false;
    }

    const Classification = title.split("[")[1].split("]")[0] ;
    alert(Classification);

    alert("AS 신청 완료");
    return true;
}
function reset() {

}