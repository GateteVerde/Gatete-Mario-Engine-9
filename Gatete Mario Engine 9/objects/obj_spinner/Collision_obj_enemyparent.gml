/// @description Kill enemy NPCs with a tail spin

//Play 'Kick' sound
audio_play_sound(snd_kick, 0, false);
	
//With the enemy
with (other) {
	
	//Set killer id and kill
	killer_id = other.id;
	event_user(4);
	
	//If this object sprite is one of the following
	if (global.powerup == cs_cape)
	|| (global.powerup == cs_raccoon)
	|| (global.powerup == cs_tanooki)
	|| (global.powerup == cs_fraccoon)
	|| (global.powerup == cs_iraccoon) {
		
		//Set vertical speed
		imdead.vspeed = (swimming) ? -1.5 : -6;
	
		//Set horizontal speed
		if (other.bbox_left + other.bbox_right/2 < bbox_left + bbox_right/2)
			imdead.hspeed = 0.5;
		else if (other.bbox_left + other.bbox_right/2 > bbox_left + bbox_right/2)
			imdead.hspeed = -0.5;
	}
}

//Get 200 points
with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) value = 200;
	
//Create spin thump
with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
	sprite_index = spr_spinthump;