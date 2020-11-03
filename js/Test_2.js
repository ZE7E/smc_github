const BLACKJACK=21;
let sum = 0;
while(true){
    result = prompt("블랙잭", "입력");
    if(sum>BLACKJACK){
        alert("실패하셨습니다.");  
        break;
    }else if(sum===BLACKJACK){
        alert("승리하셨습니다!");
        break;
    }else{
        sum += result;
    }
}


