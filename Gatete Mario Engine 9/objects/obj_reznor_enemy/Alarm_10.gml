/// @description Start boss battle

//Activate platform
with (obj_reznor) active = 2;

//Start shooting fire
alarm[0] = 120 + round(random(120));

//Set frame
image_index = 1;