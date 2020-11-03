const ID="dlrjswn";
const PASSWORD="1712";
result1 = prompt("아이디","입력");
result2 = prompt("비밀번호","입력");
if(result1===ID){
    if(result2===PASSWORD){
        alert("로그인 성공");
    }else{
        alert("로그인 실패. 비밀번호를 확인해주세요");
    }
}else{
    alert("로그인 실패. 아이디를 확인해주세요");
}

