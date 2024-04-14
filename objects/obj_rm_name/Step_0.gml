if (intro == 0)
{
	currentFrame++
	x = EaseOutQuint(currentFrame,-280,290,maxFrame)
}
fader++
if fader >= 150
{
alpha -= fade_speed
	if alpha <= 0
		instance_destroy()
}