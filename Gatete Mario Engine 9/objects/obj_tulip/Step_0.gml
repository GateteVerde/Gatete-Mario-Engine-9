/// @description Tulip logic

//Show message
showing += (collision_circle(x+8, y+8, 64, obj_mario, 0, 0)) ? 0.1 : -0.1;
showing = clamp(showing, 0, 1);

//Animate based if Mario is nearby
image_speed = 0.15 + (0.15 * showing);

//Anim
stem_anim += 0.3;

//Set tulip head sprite
sprite_index = (showing == 0) ? spr_tulip : spr_tulip_talk;

//If this object is on ground
if (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0))
|| (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_slopeparent, 1, 0))
	stem_sprite = spr_tulip_stem;
else
	stem_sprite = spr_tulip_stem_fly;