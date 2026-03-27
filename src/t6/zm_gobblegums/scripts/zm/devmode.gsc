#include scripts\zm\maxlib;
#include common_scripts\utility;
init()
{
	level thread onPlayerConnect();
}

onPlayerConnect()
{
	for ( ;; )
	{
		level waittill("connecting", player);
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned()
{
	self endon("disconnect");

	flag_wait("initial_blackscreen_passed");

	self thread playerInit();

	for ( ;; )
	{
		self thread playerUpdate();
		wait 0.05;
	}
}

playerInit()
{
	self.hud_x = ml_create_value(1.2, -200, 175, &"X: ");
	self.hud_y = ml_create_value(1.2, -200, 160, &"Y: ");
	self.hud_z = ml_create_value(1.2, -200, 145, &"Z: ");
}

playerUpdate()
{
	self.hud_x ml_update_number(self.origin[0]);
	self.hud_y ml_update_number(self.origin[1]);
	self.hud_z ml_update_number(self.origin[2]);
}
