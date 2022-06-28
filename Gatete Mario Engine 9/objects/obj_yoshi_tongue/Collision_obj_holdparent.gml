/// @description Eat holdable items

if (!hunger)
&& (other.object_index != obj_trampoline_timed)
&& (other.object_index != obj_trampoline_switch_activated) {

	//If this is a p-switch
	if (other.sprite_index == spr_pswitch_press)
	|| (other.sprite_index == spr_gswitch_press)
	exit;

    //Item eaten
    hunger = 1;

    //Move tongue back
    ready = 1;
    alarm[0] = 8;
	
	//Put it in Yoshi's mouth
    obj_yoshi.mouthholder = other.object_index;

    //Remember its sprite
    obj_yoshi.mouthsprite = other.sprite_index;
	
	//If this item is breakable, remember shard
	if (other.object_index == obj_brick_blue_th) {
	
		obj_yoshi.mouthshard = other.shard_sprite;
	}

    //Food sprite
    foodsprite = other.sprite_index;

    //Food offset
    foodoffset = 0;

    //Destroy food
    with (other) instance_destroy()
}