/// @description Deploy a bomb

//If the skeeter deployed a bomb
if (sprite_index == spr_skeeter_pink_deploy) {

	//Set the default sprite
	sprite_index = spr_skeeter_pink;
	
	//Drop bomb
	instance_create_depth(x, y, 50, obj_skeeter_bomb);

	//Not ready
	ready = 0;

	//Move again after a second
	alarm[0] = 60;
}
