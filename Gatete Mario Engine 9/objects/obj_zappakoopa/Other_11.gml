/// @description Turn into a stunned mecha koopa

//Create stunned galoomba
with (instance_create_depth(x, y, -2, obj_mechakoopa_down)) {

    //Set the sprite
    sprite_index = spr_zappakoopa_sq;
	
	//Debris sprite
	debris_sprite = spr_zappakoopa_debris;
    
    //Stun sprite
    stun1 = spr_zappakoopa_sq;
    stun2 = spr_zappakoopa_sq2;
    
    //Return
    returnobj = obj_zappakoopa;
    
    //Hereby scale
    dir = other.xscale;
}

//Destroy
instance_destroy();
