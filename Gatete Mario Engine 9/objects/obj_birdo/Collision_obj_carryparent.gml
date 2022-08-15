/// @description Damage Birdo

//If the Birdo is vulnerable
if (invulnerable == false) {

	//If the Birdo still has hp
	if (hp > 1) {
	
		//Play 'Hurt' sound
		audio_play_sound(snd_hurt, 0, false);
		
		//Set damage sprite
		sprite_index = spr_birdo_damage;
		
		//Do not animate
		image_speed = 0;
		image_index = 0;
		
		#region STOP
		
			xspeed = 0;
			for (var i=0; i<12; i++) {
				
				if (alarm[i] > -1)
					alarm[i] = -1;
			}
		#endregion
		
		//Decrement hp
		hp--;
	
		//Set hurt state
		alarm[11] = 60;
		invulnerable = true;
	}

	//Otherwise
	else {

		//Get killer ID
		killer_id = other.id;
		
		//Get 2000 points
		with (instance_create_depth(x, y, -6, obj_score)) value = 2000;
		
		//Defeat
		event_user(0);
	}
	
	//Bounce
    other.yspeed = -3;
    
    //Reduce horizontal speed
    other.xspeed = other.xspeed/1.5;
	
	//Disallow collisions
	if (other.object_index == obj_enemy_carried) other.turnback = -1;
	
	//Create spin thump
    with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
		sprite_index = spr_spinthump;	
}