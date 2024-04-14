if other.hurt = 0
{
	image_xscale = -1
    other.hurt = 1;
    ID = other;
	audio_play_sound(snd_hit,0,0);
    if global.turn == 0 //&& obj_battlecontrol.enemyid[obj_pep_battle.targetchoose] = ID
	|| global.turn == 1 //&& obj_battlecontrol.enemyid[obj_gustavob.targetchoose] = ID
    {
        switch (attacknum)
        {
            case 0:
                event_user(0);
                break;
        }
    }
}

global.posx = x;
global.posy = y;