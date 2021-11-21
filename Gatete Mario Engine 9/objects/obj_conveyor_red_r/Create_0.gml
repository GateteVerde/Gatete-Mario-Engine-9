/// @description Right Red Conveyor Belt

//Inherit the parent event
event_inherited();

//Animate
image_speed = (global.on_off_block == 1) ? -abs(belt_power) : abs(belt_power);