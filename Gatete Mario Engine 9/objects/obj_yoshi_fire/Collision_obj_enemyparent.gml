/// @description Kill NPC with fireball

//If the enemy is vulnerable
if (other.vulnerable == 0) {
	
	//If the enemy can be hit with projectiles and is vulnerable to them
	if (other.firehp > 0) 
	&& (other.invulnerable == false) {
	
		//With the NPC
		with (other) {
			
			//Play 'Kick' sound
			audio_play_sound(snd_kick, 0, false);
		
			//Decrement projectile hp
			firehp--;
			
			//Become invulnerable for a bit
			invulnerable = true;
			alarm[11] = 4;
		}
	}
	
	//If firehp is equal or lower than 0, perform kill event
	else if (other.firehp <= 0) {
	
		//If the enemies can turn into coins
		if (global.enemy_to_coin == true) {
		
			//Play 'Kick' sound
			audio_play_sound(snd_kick, 0, false);
		
			//Turn into a coin
			with (instance_create_depth(other.x, other.y, -2, obj_coinnpc)) {
		
				//Jump a bit
				yspeed = -4;
				y--;
			
				//Move in the opposite direction of the player
				if (!instance_exists(obj_mario))
				|| (obj_mario.x < x)
					xspeed = 0.5;
				else
					xspeed = -0.5;
			}
		
			//Create smoke
			instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -4, obj_smoke);
		
			//Destroy
			with (other) instance_destroy();
		}
	
		//Otherwise
		else {
	
			//Play 'Kick' sound
			audio_play_sound(snd_kick, 0, false);
		
			//Kill NPC
			with (other) {
		
				killer_id = other.id;
				event_user(0);
			}
		
			//Get 200 points
			with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
				value = 200;
		}
	}
}