/// @description Turn into a stunned mecha koopa

//Create stunned galoomba
with (instance_create_depth(x, y, -2, obj_mechakoopa_down)) {

    //Set the sprite
    sprite_index = spr_blastakoopa_sq;
	
	//Debris sprite
	debris_sprite = spr_blastakoopa_debris;
    
    //Stun sprite
    stun1 = spr_blastakoopa_sq;
    stun2 = spr_blastakoopa_sq2;
    
    //Return
    returnobj = obj_blastakoopa;
    
    //Hereby scale
    dir = other.xscale;
}

//Destroy
instance_destroy();
