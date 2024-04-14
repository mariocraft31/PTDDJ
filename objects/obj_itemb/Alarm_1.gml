//Mario throws the item
if global.turn = 0
{
    with obj_pep_battle 
		image_index = 0;
    with obj_pep_battle 
		image_speed = 0.275;
    //Mario consumes the item
    if obj_pep_battle.targetchoose = 1
        with obj_pep_battle 
			moveto = 7;
    //Mario throws the item
    else if obj_pep_battle.targetchoose = 2
    {
        with obj_gustavob 
			image_index = 0;
        with obj_gustavob 
			image_speed = 0.275;
        with obj_pep_battle 
			moveto = 10;
        with obj_gustavob
			moveto = 8;
    }
    if zgravityon = 0
    {
        zspeed = 12;
        ground = 0;
        zgravityon = 1;
        //audio_play_sound(snd_throw,0,0);
    }        
}
//gustavo throws the item
if global.turn = 1
{
    with obj_gustavob 
		image_index = 0;
    with obj_gustavob 
		image_speed = 0.275;
    //gustavo consumes the item
    if obj_gustavob.targetchoose = 2
        with obj_gustavob
			moveto = 7;
    //gustavo throws the item
    else if obj_gustavob.targetchoose = 1
    {
        with obj_pep_battle
			image_index = 0;
        with obj_pep_battle 
			image_speed = 0.275;
        with obj_gustavob 
			moveto = 10;
        with obj_pep_battle 
			moveto = 8;
    }
    if zgravityon = 0
    {
        zspeed = 12;
        ground = 0;
        zgravityon = 1;
        //audio_play_sound(snd_throw,0,0);
    }        
}
alarm[2] = 5;