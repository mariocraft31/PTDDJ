//Level up gustavo
if global.turn = -1
    global.turn = -1.5;
if obj_gustavob.x >= 106 && obj_gustavob.y >= 140
{
    locked = 0;
    global.turn = -1.75; //gustavo's Level Up turn
    obj_gustavob.x = 106;
    obj_gustavob.y = 140;
    __background_set( e__BG.Index, 0, bg_levelup );
    __background_set( e__BG.Alpha, 0, 1 );
    __background_set( e__BG.Visible, 7, false );
    __background_set( e__BG.HSpeed, 0, -1 );
    __background_set( e__BG.VSpeed, 0, -0.75 );
    __background_set( e__BG.Visible, 1, false );
    __background_set( e__BG.Visible, 2, false );
    __background_set( e__BG.Visible, 3, false );
    __background_set( e__BG.Visible, 4, false );
    __background_set( e__BG.Visible, 5, false );
    __background_set( e__BG.Visible, 6, false );
    //audio_stop_sound(snd_spin);
    //audio_play_sound(snd_levelup,0,0);
    with obj_gustavob stance = 11;
    //alarm[7] = 45; //Play voice
}
else
{
    locked = 0;
    //if !audio_is_playing(snd_spin)
    //    audio_play_sound(snd_spin,0,0);
    if __background_get( e__BG.Alpha, 0 ) > 0
    {
        __background_set( e__BG.Alpha, 0, __background_get( e__BG.Alpha, 0 ) - (0.1) );
        padvisibility += 0.1;
    }
    with obj_gustavob image_speed = 0.275;
    with obj_gustavob moveto = -1;
    with obj_gustavob mp_linear_step(107,141,1,0);
    with obj_gustavob stance = 7;
    with obj_pep_battle visible = false;
    scr_gustavoLevels(); //Check stats to add for gustavo
    alarm[6] = 1;
}

