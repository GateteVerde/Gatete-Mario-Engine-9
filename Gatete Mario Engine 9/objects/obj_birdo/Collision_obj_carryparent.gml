/// @description Damage Birdo

//If the Birdo is vulnerable
if (invulnerable == false) 
&& (other.sprite_index != spr_birdo_bowtie_pickup) {
	
	//Play 'Kick' sound
	audio_play_sound(snd_kick, 0, false);

	//If the Birdo still has hp
	if (hp > 1) {
	
		//Play 'Hurt' sound
		audio_play_sound(snd_hurt, 0, false);
		
		//Set damage sprite
		sprite_index = spr_birdo_damage;
		
		//Do not animate
		image_speed = 1;
		
		#region STOP
		
			xspeed = 0;
			for (var i=0; i<12; i++) {
				
				if (alarm[i] > -1)
					alarm[i] = -1;
			}
		#endregion
		
		//Decrement hp
		hp--;
		
		//End shooting
		shooting = 0;
	
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
		
		//Create crystal if allowed to
		if (drop_crystal == true) {

			with (instance_create_depth(x-8, y-16, -2, obj_birdo_crystal)) {
	
				xspeed = 0.5 * other.xscale;
				yspeed = -4;
				y--;
			}
		}
		
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