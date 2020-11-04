kg = prompt("kg");

let count;
while(true){
    if(kg%5===0){
        count = kg / 5;
        break;
    } else if(kg<=0){
        count = -1;
        break;
    }
    kg -= 3;
    count ++;
}