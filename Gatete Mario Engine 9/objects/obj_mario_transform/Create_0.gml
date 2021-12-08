/// @description Mario is evolving, ok no :)

//Sets the animation to reproduce.
//0: Small to big
//1: Big to small
//2: Powerup
//3: Powerdown
//4: Poof
//5: Mega Mushroom Grow (DO NOT USE)
//6: Mega Mushroom Shrink (DO NOT USE)
sequence = 0;

//Sets and starts the animation sequences.
ready = 0;

//How many times does the animation loop?
loop = 0;

//Facing direction
direct = obj_mario.xscale;

//Destroy these objects first
with (obj_spinner) instance_destroy();
with (obj_dropdown) instance_destroy();
	
//Hide player elements
with (obj_cape) visible = false;
with (obj_wallrunner) visible = false;

//Make Mario invisible
if (instance_exists(obj_mario)) {
	
	//Set the sprite
	sprite_index = obj_mario.sprite_index;

	//Make Mario invisible.
	obj_mario.visible = 0;
    
	//Snap to position.
	x = round(obj_mario.x);
	y = round(obj_mario.y);
}

//Begin animation and screen freeze
alarm[0] = 2;