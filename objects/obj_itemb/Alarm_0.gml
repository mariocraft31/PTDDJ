//Grow the item
if image_xscale < 1 && image_yscale < 1
{
    image_xscale += 0.1;
    image_yscale += 0.1;
    alarm[0] = 2;
}
else
{
    if global.turn = 0
        with obj_pep_battle
			image_single = 18;
    else if global.turn = 1
        with obj_gustavob
			image_single = 18;
    alarm[1] = 30;
    audio_play_sound(sfx_taunt,0,0);
}