/// @description Set up 'mapstate.idle' status if in 'mapstate.wait' state

if (status == mapstate.wait)
    status = mapstate.idle;