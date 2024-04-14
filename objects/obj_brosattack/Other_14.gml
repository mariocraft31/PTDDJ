//Grow the item
if image_xscale < 1 && image_yscale < 1
{
    image_xscale = 1
    image_yscale = 1
}
else
{
    /*if global.turn = 0
        with obj_pep_battle 
			image_single = 18;
    else if global.turn = 1
        with obj_gustavob 
			image_single = 18;
    //audio_play_sound(snd_badge,0,0);*/
    ready = 1;
}