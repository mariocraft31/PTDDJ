if phase = 2
{
    if drawat > 1
    {
        //audio_play_sound(snd_select,0,0);
        movechoose += -1;
    }
    if battleblock = 3
    {
        pagenext -= 1;
        if movechoose = 0 && page = 1 && itemdifmax = 20
        {
            page = 4;
            movechoose = 5;
            pagenext = 20;
        }
        else if movechoose = 0 && page = 2
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
        else if movechoose = 0 && itemdifmax = 19 && page = 1
        {
            page = 4;
            movechoose = 4;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 18 && page = 1
        {
            page = 4;
            movechoose = 3;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 17 && page = 1
        {
            page = 4;
            movechoose = 2;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 16 && page = 1
        {
            page = 4;
            movechoose = 1;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 15 && page = 1
        {
            page = 3;
            movechoose = 5;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 14 && page = 1
        {
            page = 3;
            movechoose = 4;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 13 && page = 1
        {
            page = 3;
            movechoose = 3;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 12 && page = 1
        {
            page = 3;
            movechoose = 2;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 11 && page = 1
        {
            page = 3;
            movechoose = 1;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 10 && page = 1
        {
            page = 2;
            movechoose = 5;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 9 && page = 1
        {
            page = 2;
            movechoose = 4;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 8 && page = 1
        {
            page = 2;
            movechoose = 3;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 7 && page = 1
        {
            page = 2;
            movechoose = 2;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 6 && page = 1
        {
            page = 2;
            movechoose = 1;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 5 && page = 1
        {
            page = 1;
            movechoose = 5;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 4 && page = 1
        {
            page = 1;
            movechoose = 4;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 3 && page = 1
        {
            page = 1;
            movechoose = 3;
            pagenext = itemdifmax;
        }
        else if movechoose = 0 && itemdifmax = 2 && page = 1
        {
            page = 1;
            movechoose = 2;
            pagenext = itemdifmax;
        }
    }
}

