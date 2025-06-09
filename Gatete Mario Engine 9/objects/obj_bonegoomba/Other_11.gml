/// @description Custom Stomp script

//If this enemy has not been stomped yet
if (ready == 0) {
	
	//Play 'Crumble' sound
	audio_play_sound(snd_crumble, 0, false);
	
	#region SHARDS
	
		shard = instance_create_depth(x, y + 8, -2, obj_shard);
		with (shard) {

			//Set sprite
			sprite_index = spr_bonegoomba_shard;
			image_speed = 0;
			image_index = 3;
	
			//Set motion
			motion_set(45, 6);
		}

		shard = instance_create_depth(x, y + 8, -2, obj_shard);
		with (shard) {

			//Set sprite
			sprite_index = spr_bonegoomba_shard;
			image_speed = 0;
			image_index = 1;
	
			//Set motion
			motion_set(60, 6);
		}

		shard = instance_create_depth(x, y + 8, -2, obj_shard);
		with (shard) {

			//Set sprite
			sprite_index = spr_bonegoomba_shard;
			image_speed = 0;
			image_index = 0;
	
			//Set motion
			motion_set(120, 6);
		}

		shard = instance_create_depth(x, y + 8, -2, obj_shard);
		with (shard) {

			//Set sprite
			sprite_index = spr_bonegoomba_shard;
			image_speed = 0;
			image_index = 2;
	
			//Set motion
			motion_set(135, 6);
		}	
	#endregion
	
	//Set the state
	ready = 1;
	
	//Set the sprite
	sprite_index = spr_bonegoomba2;
}

//Otherwise if this enemy has been stomped once, turn into a pancake
else if (ready == 1) {
	
	//Turn into a pancake
	with (instance_create_depth(x, y+1, -6, obj_stomped)) {

		sprite_index = spr_bonegoomba_sq;
		image_xscale = other.xscale;
	}
	
	//Destroy
	instance_destroy();
}