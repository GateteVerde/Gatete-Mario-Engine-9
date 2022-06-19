/// @description Destroy chains if the chomp does not exist.

if (!instance_exists(chomp)) {

    with (chain[0]) instance_destroy();
    with (chain[1]) instance_destroy();
    with (chain[2]) instance_destroy();
    with (chain[3]) instance_destroy();
}
