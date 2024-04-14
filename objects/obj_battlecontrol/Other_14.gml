//Level Up System
if global.turn < 0 && locked = 0
{
    //Check to see if Mario leveled up
    if global.Pdead = 0 && global.Pexpleft <= 0 && instance_exists(obj_pep_battle)
    {
        //audio_play_sound(snd_confirm,0,0);
        global.Plvl += 1; //Increase level by 1
        locked = 1;
        if global.Pdead = 0 && global.Pexpleft <= 0 && instance_exists(obj_pep_battle) //Level up Mario
            scr_MarioNextLevel();
        alarm[5] = 15; //Go to level up Mario
    }
    //Check to see if gustavo leveled up
    else if global.Gdead = 0 && global.Gexpleft <= 0 && instance_exists(obj_gustavob)
    {
        //audio_play_sound(snd_confirm,0,0);
        global.Glvl += 1; //Increase level by 1
        locked = 1;
        if global.Gdead = 0 && global.Gexpleft <= 0 && instance_exists(obj_gustavob) //Level up gustavo
            scr_gustavoNextLevel();
        alarm[6] = 15; //Go to level up gustavo
    }
    //Return to Overworld
    else if global.turn = -1
    {
        //audio_stop_sound(mus_Fanfare);
        audio_play_sound(sfx_confirm,0,0);
		global.stunned = true;
		global.outcome = 1;
		with (obj_ow_player)
			active = true
    }
}

