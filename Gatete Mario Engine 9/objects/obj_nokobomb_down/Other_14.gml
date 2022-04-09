/// @description Turn into a stunned galoomba

//Create held object
imheld = instance_create_depth(x, y-2, -2, obj_nokobomb_down);

//Make the held object hereby the sprite
imheld.sprite_index = sprite_index;

//Make the held object hereby the speed
imheld.image_speed = image_speed;

//Make the held object hereby the scale
imheld.dir = xscale;

//Set the vspeed of the flip object
imheld.yspeed = (swimming) ? -2.5 : -5;

//Set the hspeed of the flip object
#region Horizontal speed

	if ((other.bbox_left+other.bbox_right)/2 < (bbox_left+bbox_right)/2)
	    imheld.xspeed = (swimming) ? 0.25 : 0.5;
	else if ((other.bbox_left+other.bbox_right)/2 > (bbox_left+bbox_right)/2)
	    imheld.xspeed = (swimming) ? 0.25 : -0.5;
	
#endregion

//Destroy
instance_destroy();