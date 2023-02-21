/// @description Flip the shell

//Create held object
imheld = instance_create_depth(x, y-2, -2, obj_shell);

//Make the held object hereby the sprite
imheld.sprite_index = sprite_index;

//Make the held object hereby the scale
imheld.dir = xscale;

//Flip it
imheld.flip = (sprite_index == spr_shell_koopatrol) ? 0 : 1;

//Hold or not hold a koopa inside
imheld.koopainside = koopainside;

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