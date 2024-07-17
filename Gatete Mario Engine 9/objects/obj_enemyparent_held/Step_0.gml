/// @description Holdable Enemy NPC logic

//Inherit 'obj_holdparent' Step event
event_perform_object(obj_holdparent, ev_step, ev_step_normal);

//Reset combo
if (yadd == 0) {
	
	if (hitcombo > 0)
		hitcombo = 0;
}

//Reset thrown up state
if (thrown_up == true)
&& (held == 1)
	thrown_up = false;

//If the Silver P-Switch is active and the enemy is inside the view and can turn into a silver coin
if (obj_levelcontrol.gswitch_on == true) 
&& (turn_silver == true)
&& (outside_view() == false)
	exit;