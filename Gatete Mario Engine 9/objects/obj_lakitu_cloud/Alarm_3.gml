/// @description Leave trail

//If this is a lakitu cloud
if (sprite_index == spr_lakitu_cloud) {

	alarm[3] = 4;
	with (instance_create_depth(x, y+10, 50, obj_smoke))
		sprite_index = spr_cloudtrail;
}