if instance_exists(obj_camera)
    {
        obj_camera.cutscene = cutscene
        with (obj_camera)
            event_user(0)
    }
else if (cutscene == 0 && (!instance_exists(obj_shake)))
    {
        wd = (x - floor(((__view_get(2, 0) / 2) - (initwd / 2))))
        ht = (y - floor(((__view_get(3, 0) / 2) - (initht / 2))))
        __view_set(0, 0, wd)
        __view_set(1, 0, ht)
        if (__view_get(0, 0) < 0)
            __view_set(0, 0, 0)
        if (__view_get(0, 0) > (room_width - __view_get(2, 0)))
            __view_set(0, 0, (room_width - __view_get(2, 0)))
        if (__view_get(1, 0) < 0)
            __view_set(1, 0, 0)
        if (__view_get(1, 0) > (room_height - __view_get(3, 0)))
            __view_set(1, 0, (room_height - __view_get(3, 0)))
    }
