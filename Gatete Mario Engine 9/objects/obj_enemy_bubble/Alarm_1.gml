/// @description Pop and release the enemy

//Play 'Pop' sound
audio_play_sound(snd_pop, 0, false);

//Create a enemy based on the enemy's sprite
switch (sprout) {
	
	//Coin
    case (spr_coin): {
		
        instance_create_layer(x+8+(sprite_get_xoffset(sprout)), y+10, "Main", obj_coin);
	} break;
	
	//Mushroom
    case (spr_mushroom): {
		
        with (instance_create_layer(x+8+(sprite_get_xoffset(sprout)), y+10, "Main", obj_mushroom))
			move_after_landing = 1;
	} break;

    //Galoomba
    case (spr_galoomba): {
            
        with (instance_create_depth(x+8+(sprite_get_xoffset(sprout)), y+10, -2, obj_galoomba)) {
        
            xscale = other.xscale;
            bubble = 1;
			alarm[10] = -1;
        }
    } break;
        
    //Cannon Bob-Omb
    case (spr_bobomb_cannon): {
            
        with (instance_create_depth(x+8+(sprite_get_xoffset(sprout)), y+10, -2, obj_bobomb_cannon)) {
        
            xscale = other.xscale;
            bubble = 1;
			alarm[10] = -1;
        }
    } break;
        
    //Cheep-Cheep
    case (spr_cheepcheep):
        instance_create_depth(x+8+(sprite_get_xoffset(sprout)), y+10, -2, choose(obj_cheepcheep_h, obj_cheepcheep_v)); break;
}

//Create 'Pop' effect
with (instance_create_depth(x+16, y+16, -6, obj_smoke)) sprite_index = spr_pop;

//Destroy
instance_destroy();