/// @description Spit a mini cheep-cheep

//Create a mini-cheep
myson = instance_create_depth(x, y+4, -2, obj_bigbertha_cheep);
with (myson) {

    //Set the hspeed.
    xspeed = 1.5*sign(other.dir);
    
    //Set the facing direction.
    xscale = 1*sign(other.dir);
}

//Resume movement
alarm[1] = 32;
