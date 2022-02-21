/// @description Enemy NPC logic

//Inherit the parent event
event_inherited();

//Turn on enemies
event_user(2);

//Turn on ledges
event_user(3);

//If the Silver P-Switch is active and the enemy is inside the view and can turn into a silver coin
if (obj_levelcontrol.gswitch_on == true) 
&& (turn_silver == true)
&& (outside_view() == false)
	exit;