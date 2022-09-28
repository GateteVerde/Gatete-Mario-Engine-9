/// @description Hurt only if outside the pipe

if (x == xstart)
exit;
	event_perform_object(obj_enemyparent, ev_collision, obj_mario);