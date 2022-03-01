/// @description Kill enemy NPCs with a tail spin

//If the item is being held or it's moving up, ignore
if (other.held == 1)
|| (other.yspeed < 0)
exit;

//Play 'Kick' sound
audio_play_sound(snd_kick, 0, false);
	
//Stun the other enemy
with (other) event_user(4);

//Get 200 points
with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) value = 200;
	
//Create spin thump
with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
	sprite_index = spr_spinthump;