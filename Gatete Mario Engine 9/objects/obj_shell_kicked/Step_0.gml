/// @description Kicked Koopa Shell logic

//Previous horizontal speed
prevxspeed = xspeed;    

//Inherit event
event_inherited();

//Check for 1 block gaps and blocks in the way
event_user(5);

//If the direction changes...
if (sign(xspeed) != sign(prevxspeed)) {

    //If the item is not outside
    if (outside_view() == false) {
    
        //Play 'Bump' sound
        audio_play_sound(snd_bump, 0, false);
    }
    
    //Create shell thump
	with (instance_create_depth(x+(5*sign(prevxspeed)), y, -6, obj_shellthump)) bump = true;
}

//If this is a big shell, create mask
if (sprite_index == spr_shell_big) 
|| (sprite_index == spr_shell_red_big) {
	
	//Set mask
	mask_index = spr_mask_npc_common_32x32;
	
	//Make it non-edible
	edible = 2;
	
	//If the masher does not exist, create it
	if (masher == -1)
		masher = instance_create_layer(x, y, "Main", obj_shell_mask);
	
	//Otherwise, if it exists
	else if (masher != -1) {
		
		masher.x = round(x);
		masher.y = round(y);
		masher.image_xscale = 1 * sign(xspeed);
	}
}