/// @description Flip the shell

//Create held object
imheld = instance_create_depth(x, y-2, -2, obj_shell);

//Make the held object hereby the sprite
imheld.sprite_index = spr_shell_koopatrol;

//Make the held object hereby the scale
imheld.dir = xscale;

//Flip it
imheld.flip = 0;

//Hold or not hold a koopa inside
imheld.koopainside = -1;

//Set the motion of the flip object
#region Horizontal / Vertical speed

	//Set the vertical speed of the flip object
	imheld.yspeed = (swimming) ? -2.5 : -5;

	//Set the horizontal speed of the object
	if ((other.bbox_left+other.bbox_right)/2 < (bbox_left+bbox_right)/2)
	    imheld.xspeed = (swimming) ? 0.25 : 0.5;
	else if ((other.bbox_left+other.bbox_right)/2 > (bbox_left+bbox_right)/2)
	    imheld.xspeed = (swimming) ? 0.25 : -0.5;
	
#endregion

//Destroy
instance_destroy();