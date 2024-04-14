//Victory
if global.turn > -1
{
    global.turn = -1;
    if global.Pdead = 0 && instance_exists(obj_pep_battle)
    {
        if obj_pep_battle.phase < 0
            wintype = obj_pep_battle.phase;
        obj_pep_battle.image_speed = 0.45;
        obj_pep_battle.phase = 0.75;
        obj_pep_battle.stance = 7;
    }
    if global.Pdead > 0 or !instance_exists(obj_pep_battle)
    {
        obj_pep_battle.phase = 0.25;
        obj_pep_battle.control = 0;
    }
    if global.Gdead = 0 && instance_exists(obj_gustavob)
    {
        if obj_gustavob.phase < 0
            wintype = obj_gustavob.phase;
        obj_gustavob.phase = 0.75
        obj_gustavob.image_speed = 0.45;
        obj_gustavob.stance = 7;
    }
    if global.Gdead > 0 or !instance_exists(obj_gustavob)
    {
        obj_gustavob.phase = 0.25;
        obj_gustavob.control = 0;
    }
    audio_stop_sound(global.music);
    //audio_stop_all();
    //music_play(mus_Fanfare);
    alarm[3] = 90;
    //__background_set( e__BG.Index, 7, bg_darkened );
    //__background_set( e__BG.Visible, 7, true );
}

