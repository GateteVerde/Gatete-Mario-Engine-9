/// @description Shoot fireballs

//Set sprite
sprite_index = spr_lavalotus_spit;

//Animate
alarm[1] = 60;

//Create batch of fireballs
for (i=0; i<5; i++) {

    ID = instance_create_depth(x, y-4, 50, obj_lavalotus_ball);
    with (ID) {
    
        speed = 0.35;
        direction = 70+(10*other.i);
    }
}
