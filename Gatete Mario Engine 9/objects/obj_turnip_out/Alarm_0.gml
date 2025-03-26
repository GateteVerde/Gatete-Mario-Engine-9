/// @description Check the frame of the puller object

//If the vegetable is being drawn
if (drawpiece) {

    //Play 'Break' sound
    audio_play_sound(snd_break, 0, false);
    
    //Do not draw
    drawpiece = 0;
    
    //Create shards
	shard_create(spr_shard, x + 8, y + 8, -2, 6, 45);
	shard_create(spr_shard, x + 8, y + 8, -2, 6, 60);
	shard_create(spr_shard, x + 8, y + 8, -2, 6, 120);
	shard_create(spr_shard, x + 8, y + 8, -2, 6, 135);
}

//Depth
depth = -6;

//Draw it
drawpiece2 = 3;

//If the puller object does exist...
if (instance_exists(obj_mario_puller)) {

    //If the player is not small (Frame 2 and above)
    if (obj_mario_puller.image_index > 1)
        vspeed += -2.5;
        
    //Otherwise, if the player is not big (Frame 1 and below)
    else if (obj_mario_puller.image_index <= 1)
        vspeed += -1.5;
}