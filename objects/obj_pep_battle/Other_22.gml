//RIGHT
if global.turn = 0
{
    if battleblock = 2 && phase = 3
    {}
    else
    {
        pagenext = 1;
        page = 1;
        if phase = 1 or phase = 2
        {
            //audio_play_sound(snd_choose,0,0);
            battleblock += 1;
            movechoose = 1;
        }
        if battleblock = 4
            battleblock = 0;
        if phase = 2
            phase = 1;
        if phase = 3
        {
            targetchoosego = 0;
            if (global.Gdead > 0 && targetchoose = 0 && pagenext <> 14 && pagenext <> 15 && battleblock = 3)
            or (global.Gdead = 0)
                targetchoose += 1;
            else if global.Gdead > 0 && targetchoose = 0 && battleblock = 3
            {
                if pagenext = 14 or pagenext = 15
                    targetchoose = 2;
            }
            else if battleblock <> 3
                targetchoose += 1;
            if battleblock <> 3 //Select enemy
            {
                if !instance_exists(obj_battlecontrol.enemyid[targetchoose])
                {
                    do
                    {
                        targetchoose += 1;
                        if targetchoose > 5
                            targetchoose = 0;
                    }
                    until (instance_exists(obj_battlecontrol.enemyid[targetchoose]) or targetchoose = 0);
                }
            }
            if battleblock = 3 //Select brother
            {
                if !instance_exists(obj_battlecontrol.broid[targetchoose]) && global.Gdead = 0
                {
                    do
                    {
                        targetchoose += 1;
                        if targetchoose > 2
                            targetchoose = 0;
                    }
                    until (instance_exists(obj_battlecontrol.broid[targetchoose]) or targetchoose = 0);
                }             
            }
        }
    }
}