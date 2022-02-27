/// @description Eat bricks

if (!hunger) {

    //Move tongue back
    ready = 1;
    alarm[0] = 8;
		
	//Item eaten
	hunger = 1;

	//Put it in Yoshi's mouth
	obj_yoshi.mouthholder = obj_brick_blue_th;
    
	//Remember its sprite
	obj_yoshi.mouthsprite = other.held_sprite;
	
	//Remember the shard
	obj_yoshi.mouthshard = other.shard_sprite;
    
	//Food sprite
	foodsprite = other.held_sprite;

	//Food offset
	foodoffset = 0;

	//Destroy food
	with (other) instance_destroy();
}