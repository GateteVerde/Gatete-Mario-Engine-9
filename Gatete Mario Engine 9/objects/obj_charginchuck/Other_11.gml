/// @description Hurt the enemy

if (sprite_index != spr_charginchuck_damage) {

    //If the NPC still has HP left
    if (hp > 0) {
    
        //If the enemy can be killed with 1 or 2 projectile hits, insta-stomp the NPC.
        if (firehp < 2) {
			
			//Get 2000 points
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score)) value = 2000;
			
			//Stomp the enemy
            event_inherited();
		}
        
        //Otherwise, damage the NPC
        else {
			
			//Play 'Hurt' sound
			audio_play_sound(snd_hurt, 0, false);
        
            //Set sprite
			sprite_index = spr_charginchuck_damage;
			image_speed = 0;
			image_index = 0;
            
            //Decrement hp
            hp--;
            
            //Decrement firehp by 2
            firehp -= 2;
			
			//Push Mario depending of position
			 other.xspeed += lengthdir_x(4, point_direction(x, y, other.x, other.y));

			//Deny event
			alarm[10] = -1;
        }
    }
    
    //Otherwise, if the NPC has only one hit left
    else if (hp == 0) {
    
		//Play 'Kick' sound
		audio_play_sound(snd_kick, 0, false);
			
		//Get 2000 points
		with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score)) value = 2000;
			
		//Stomp the enemy
        event_inherited();
    }
}