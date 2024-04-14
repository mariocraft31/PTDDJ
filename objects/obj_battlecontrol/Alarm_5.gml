//Level up Mario
if global.turn = -1
    global.turn = -1.5;
if obj_pep_battle.x >= 108 && obj_pep_battle.y >= 140
{
    locked = 0;
    global.turn = -1.25; //Mario's Level Up turn
    obj_pep_battle.x = 108;
    obj_pep_battle.y = 140;
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
   // audio_play_sound(snd_levelup,0,0);
    //with obj_pep_battle stance = 11;
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
    with obj_pep_battle image_speed = 0.275;
    with obj_pep_battle moveto = -1;
    with obj_pep_battle mp_linear_step(109,141,1,0);
    with obj_pep_battle stance = 7;
    with obj_gustavob visible = false;
    scr_MarioLevels(); //Check stats to add for Mario
    alarm[5] = 1;
}

