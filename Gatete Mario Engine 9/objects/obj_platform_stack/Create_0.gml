/// @description Stack Block

//Inherit the parent event
event_inherited();

//Current height
h = 0;
h_pos = 0;

//Whether the blocks are deployed
deploy = 0;

//Create a secondary solid block
mysolid2 = instance_create_layer(x, ystart, "Main", obj_platformparent);
with (mysolid2) {

	issolid = true;
	sprite_index = spr_square;
}