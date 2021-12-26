/// @description Break blocks if Mario is giant

//Check for Mario
var mario = collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+4, bbox_bottom+6, obj_mario, 0, 0);

//If Mario does exist
if (mario) 
&& (global.powerup == cs_mega)
&& (instance_exists(obj_megashroom_timer)) {
	
	event_user(15);
	if (sprite_index == spr_qblock_big) 
	|| (sprite_index == spr_brick_big) 
	|| (sprite_index == spr_flipblock_big) 
	|| (sprite_index == spr_coinrouletteblock)
		mario.xspeed /= 4
}