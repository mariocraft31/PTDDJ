if global.Gstache >= 999
{
    global.Gstache = 999;
    global.luckyhit = true;
}
else
{
    if global.Gstache >= random(999)
        global.luckyhit = true;
    else
        global.luckyhit = false;
}