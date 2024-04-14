//UP
if phase = 2
{
    if drawat > 1 or page > 1
    {
        //audio_play_sound(snd_select,0,0);
        movechoose += -1;
    }
    if battleblock = 3
    {
        pagenext -= 1;
        if movechoose = 0 && page = 1
        {
            page = 4;
            movechoose = 5;
            pagenext = 20;
        }
        if movechoose = 0 && page = 2
        {
            page = 1;
            movechoose = 5;
        }
        else if movechoose = 0 && page = 3
        {
            page = 2;
            movechoose = 5;
        }
        else if movechoose = 0 && page = 4
        {
            page = 3;
            movechoose = 5;
        }
    }
}