/// @description Create solid mask

mysolid = instance_create_layer(x, y, "Main", obj_solid);
with (mysolid) {

	image_xscale = other.sprite_width/16;
	image_yscale = other.sprite_height/16;
}