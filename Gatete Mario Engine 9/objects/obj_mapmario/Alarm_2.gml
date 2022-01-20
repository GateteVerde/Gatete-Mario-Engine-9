/// @description Set up 'mapstate.idle' status if in 'mapstate.preidle' state

if (status == mapstate.preidle)
    status = mapstate.idle;