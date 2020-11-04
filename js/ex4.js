let i=0;
a = prompt("고정비용"); //10000000
b = prompt("가변비용"); //700000
c = prompt("판매가격");

while(true){
    if(a + (b * i) < c * i){
        break;
    }
    i++;
}
console.log(c);
