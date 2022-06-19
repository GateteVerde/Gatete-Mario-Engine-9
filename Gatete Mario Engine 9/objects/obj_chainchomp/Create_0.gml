/// @description Chain Chomp

//Max. distance
maxdist = 48;

//Center
cx = x+8;
cy = y+8;

//Taunt
taunt = 0;

//Create chomp
chomp = instance_create_depth(cx, cy, -2, obj_chomp);
with (chomp) {

    //Max. distance
    maxdist = other.maxdist;
    
    //Origin
    originx = other.cx;
    originy = other.cy;
    
    //Stop zones
    stop_l = other.cx-8;
    stop_r = other.cx+8;
}

//Create chains
for (i=0; i<4; i++) {

    //Create chain
    var b = instance_create_depth(cx, cy+5, -1, obj_chomp_chain);
    
    //Assign the chain to a id
    chain[i] = b;
}
