/// @description Snore if sleeping

if (sprite_index == spr_ripvanfish) {

    with (instance_create_depth(x, y, -6, obj_smoke)) {
    
        sprite_index = spr_snore;
        path_start(pth_bubble, 0.5, path_action_continue, 0);
    }
}
