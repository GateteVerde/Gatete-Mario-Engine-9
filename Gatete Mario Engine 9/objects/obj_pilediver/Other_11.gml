/// @description Custom Stomp script

//Play 'Break' sound
audio_play_sound(snd_break, 0, false);

//Inherit the parent event
event_inherited();

//Set the sprite
imdead.sprite_index = spr_goomba_micro;

//Create shards
shard_create(spr_shard, x, y + 8, -2, 6, 45);
shard_create(spr_shard, x, y + 8, -2, 6, 60);
shard_create(spr_shard, x, y + 8, -2, 6, 120);
shard_create(spr_shard, x, y + 8, -2, 6, 135);