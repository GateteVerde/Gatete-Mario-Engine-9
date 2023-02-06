/// @description Respawn if outside the room

if (y > room_height + 32)
&& (held == 0)
    event_perform(ev_alarm, 2);