if image_alpha <= 0
    instance_destroy();
else
{
    image_alpha -= 0.1;
    alarm[0] = 2;
}