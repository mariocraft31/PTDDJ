if phase = 2
{
    if drawat > 1
    {
        //audio_play_sound(snd_select,0,0);
        movechoose += 1;
    }
    if battleblock = 3
    {
        pagenext += 1;
        if movechoose = 6 && page = 1 && itemdifmax > 5
        {
            page = 2;
            movechoose = 1;
        }
        else if movechoose = 6 && page = 2 && itemdifmax > 10
        {
            page = 3;
            movechoose = 1;
        }
        else if movechoose = 6 && page = 3 && itemdifmax > 15
        {
            page = 4;
            movechoose = 1;
        }
        else if movechoose = 6 && itemdifmax = 20 && page = 4
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 5 && itemdifmax = 19 && page = 4
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 4 && itemdifmax = 18 && page = 4
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 3 && itemdifmax = 17 && page = 4
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 2 && itemdifmax = 16 && page = 4
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 6 && itemdifmax = 15 && page = 3
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 5 && itemdifmax = 14 && page = 3
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 4 && itemdifmax = 13 && page = 3
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 3 && itemdifmax = 12 && page = 3
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 2 && itemdifmax = 11 && page = 3
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 6 && itemdifmax = 10 && page = 2
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 5 && itemdifmax = 9 && page = 2
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 4 && itemdifmax = 8 && page = 2
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 3 && itemdifmax = 7 && page = 2
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 2 && itemdifmax = 6 && page = 2
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 6 && itemdifmax = 5 && page = 1
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 5 && itemdifmax = 4 && page = 1
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 4 && itemdifmax = 3 && page = 1
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        else if movechoose = 3 && itemdifmax = 2 && page = 1
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
        //Fail safe incase it returns a value higher than the item count
        else if movechoose > 5 && itemdifmax >= 20 && page = 4
        {
            page = 1;
            pagenext = 1;
            movechoose = 1;
        }
    }   
}