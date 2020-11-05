let json = "{ bad json}";

try {
    let user =json.parse( json );
    alert( user.name );
} catch (e) {
    alert("데이터에 에러가 있어 재요청을 시도합니다.");
    alert(e.name);
    alert(e.message);
}