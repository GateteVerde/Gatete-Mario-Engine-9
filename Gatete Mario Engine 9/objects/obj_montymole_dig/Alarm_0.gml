/// @description Break out

//Play 'Break' sound
audio_play_sound(snd_break, 0, false);

//Make a monty appear
with (instance_create_depth(x, y, -2, obj_montymole_jump)) type = other.type;

//Create shard
shard_create(spr_shard, x, y+8, -2, 6, 45);
shard_create(spr_shard, x, y+8, -2, 6, 60);
shard_create(spr_shard, x, y+8, -2, 6, 120);
shard_create(spr_shard, x, y+8, -2, 6, 135);

//Do stuff
if (sprite_index == spr_montymole_dig_wall) {

    //Turn into a purely decorative hole
    sprite_index = spr_montymole_jump;
    
    //Do not animate
    image_speed = 0;
    image_index = 1;
	
	//Set depth
	depth = 49;
	
	//Set vulnerability
	vulnerable = 100;
}
else
	instance_destroy();
