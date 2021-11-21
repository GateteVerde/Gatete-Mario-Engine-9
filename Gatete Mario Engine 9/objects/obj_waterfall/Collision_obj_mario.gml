/// @description Slowdown Mario if he is swimming on the waterfall.

//Exit the event if Mario has the frog powerup.
if (global.powerup == cs_frog)
|| (global.powerup == cs_penguin)
exit;

//If Mario is swimming.
if (other.bbox_top < bbox_bottom-12)
&& (other.swimming)
&& (other.yspeed < -1)
    other.yspeed += 1;