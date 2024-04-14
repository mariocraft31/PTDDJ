//DOWN
if phase = 2
{
    if drawat > 1 or page > 1
    {
        //audio_play_sound(snd_select,0,0);
        movechoose += 1;
    }
    if battleblock = 3
    {
        pagenext += 1;
        if movechoose = 6 && page = 1 //&& itemdifmax > 5
        {
            page = 2;
            movechoose = 1;
        }
        else if movechoose = 6 && page = 2 //&& itemdifmax > 10
        {
            page = 3;
            movechoose = 1;
        }
        else if movechoose = 6 && page = 3 //&& itemdifmax > 15
        {
            page = 4;
            movechoose = 1;
        }
        else if movechoose = 6 && page = 4
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
    }   
}