/// @description Update how many parts are above

//Keep updating
alarm[9] = 1;

repeat (99) {
        
    //If there's a pokey above
    if (instance_position(x, y-(a*16), obj_pokey))
        a++;
    else {
    
        a--;
        if (a < 1)
            a = 1;
    }
}
