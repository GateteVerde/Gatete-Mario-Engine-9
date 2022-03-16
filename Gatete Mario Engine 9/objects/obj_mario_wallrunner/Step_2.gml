/// @description Wall running logic

//If Mario does not exist
if (!instance_exists(obj_mario)) {
	
    instance_destroy();
    exit;
}

//Or Mario is transforming...
if (instance_exists(obj_mario_transform)) {
	
    instance_destroy();
    exit;
}

//Manage movement
event_user(0);

//Set up the sprite
sprite_index = global.run_sprite[global.powerup];

//Set angle
image_angle = direction;

//Animation
image_speed = 0.4;