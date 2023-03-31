/// @description Render NPC

//Inherit the parent event
event_inherited();

///Draw "!" mark
if (instance_exists(obj_mario)) {

    if (collision_rectangle(bbox_left-16, bbox_top-16, bbox_right+16, bbox_bottom, obj_mario, 0, 0))
        draw_sprite(spr_enemy_alert2, 0, x, bbox_top-16);
}