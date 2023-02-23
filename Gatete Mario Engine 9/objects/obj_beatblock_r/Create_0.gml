/// @description Red Beat Block

//Do not animate
image_speed = 0;
image_index = 0;

//Beeps
beep = 2;

//Make it beep
alarm[0] = 240;

//Make it solid
mysolid = instance_create_layer(x, y, "Main", obj_solid);
with (mysolid) {
	
	image_xscale = other.sprite_width/16;
	image_yscale = other.sprite_height/16;
}