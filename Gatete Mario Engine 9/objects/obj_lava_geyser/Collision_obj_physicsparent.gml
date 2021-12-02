/// @description Push NPCs up

if (other.bbox_bottom > yprevious+5)
&& (other.yspeed > -4)
	other.yspeed -= 0.5;