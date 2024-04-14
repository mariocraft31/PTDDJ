if _image_alpha <= 0
    instance_destroy();
else
{   
    _image_alpha -= 0.1;
    _image_xscale -= 0.1;
    _image_yscale -= 0.1;
    alarm[0] = 1;
}