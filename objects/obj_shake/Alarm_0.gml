if (global.screenshakeoff == 0)
{
    __view_set(0, camera, (cam_x + (shakex * shakesign)))
    __view_set(1, camera, (cam_y + (shakey * shakesign)))
}
if (permashake == 0)
{
    if (shakex > 0)
        shakex -= 1
    if (shakey > 0)
        shakey -= 1
}
shakesign = (-shakesign)
alarm[0] = shakespeed
if (shakex == 0 && shakey == 0)
    instance_destroy()
