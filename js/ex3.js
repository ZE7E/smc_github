let sum=1;
let sum2=1+sum;
result = prompt("입력");
console.log(sum2);
while(true){
    if(sum<result){
        sum=sum+sum2;
        console.log(sum);
        sum2=sum2+sum;
        console.log(sum2);
    }else{
        break;
    }
}