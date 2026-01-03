/// @description End of level house (SML2)

//Create the bell
instance_create_depth(x - sprite_get_xoffset(sprite_index) + 4, bbox_top + 5, 451, obj_bell); 

//Do not animate
image_speed = 0;
image_index = 0;

//Depth
depth = 450;

//Create front part
with (instance_create_depth(x, y + 1, -6, obj_castle_front)) {
	
	sprite_index = other.sprite_index;
	image_yscale = other.image_yscale;
}