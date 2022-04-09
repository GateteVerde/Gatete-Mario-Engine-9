/// @description Turn into a stunned galoomba

//Create held object
imheld = instance_create_depth(x, y-2, -2, obj_nokobomb_down);

//Set the sprite
imheld.sprite_index = spr_nokobombette_down;

//Set the animation
imheld.image_speed = 1;

//Make the held object hereby the scale
imheld.dir = xscale;

//Set the motion
#region Motion

	//Set the vertical speed of the flipped enemy
	imheld.yspeed = (swimming) ? -2.5 : -5;
	
	//Set the horizontal speed of the flipped enemy
	if ((other.bbox_left+other.bbox_right)/2 < (bbox_left+bbox_right)/2)
	    imheld.xspeed = (swimming) ? 0.25 : 0.5;
	else if ((other.bbox_left+other.bbox_right)/2 > (bbox_left+bbox_right)/2)
	    imheld.xspeed = (swimming) ? 0.25 : -0.5;
	
#endregion

//Destroy
instance_destroy();