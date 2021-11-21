/// @description Collect the coin

if (visible)
&& (other.vspeed < 0) {
	
	with (instance_create_depth(x + 8, y, -4, obj_block_coin)) sprite_index = spr_coin_npc_p;
	instance_destroy();
	exit;
}