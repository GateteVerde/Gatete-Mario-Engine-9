/// @description Toggleable Platform Track

//Inherit the parent event
event_inherited();

//Set up sprite
sprite_index = spr_track_dia_r;

//Create area modifier
aMod = instance_create_depth(x, y, 151, obj_track_modifier_area)
with (aMod) {

	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}