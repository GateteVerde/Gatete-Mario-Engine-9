/// @description Eat the fish

if (hold)
exit;

//Set the sprite of the fish
sprite_index = spr_bigbertha;

//Destroy
with (other) 
	instance_destroy();
