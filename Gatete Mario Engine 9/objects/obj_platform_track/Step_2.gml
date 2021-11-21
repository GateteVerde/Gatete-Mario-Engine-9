/// @description Platform logic (Player contact)

//Inherit event from parent
event_inherited();

//Check for the player
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If the player exists
if (mario)
&& (mario.state != playerstate.jump)
&& (mario.bbox_bottom < yprevious+5) {
		    
    //Set the platform state to "IN_LINE"
    if (state == "IDLE")
        state = "IN_LINE";
}