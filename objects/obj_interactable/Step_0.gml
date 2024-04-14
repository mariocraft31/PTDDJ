scr_depth_3d_z();

if (myinteract == 3)
{
    if (!instance_exists(mytext))
    {
        global.interact = 0
        myinteract = 0
        with (obj_ow_player)
            onebuffer = 5
    }
}