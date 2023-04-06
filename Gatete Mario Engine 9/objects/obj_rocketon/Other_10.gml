/// @description Custom Chicken death script

//Create spin smoke effect
instance_create_depth(round(bbox_left+bbox_right)/2, round(bbox_top+bbox_bottom)/2, -6, obj_spinsmoke);

//Destroy
instance_destroy();

//Exit
exit;