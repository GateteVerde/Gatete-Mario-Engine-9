/// @description Spit a ink blob

//Set the sprite
sprite_index = spr_inkpiranhaplant_spit;

//Create ink block
instance_create_depth(x, y-3, -2, obj_plantink);

//Animate
image_speed = 1;
image_index = 0;
