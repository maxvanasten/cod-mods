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
		player.last_gobblegum_round = -1;
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned()
{
	self endon("disconnect");

	flag_wait("initial_blackscreen_passed");

	self thread gobblegum_watcher();
}

add_gobblegum_machine(x, y, z)
{
	level endon("end_game");

	trigger_gobblegum = spawn("trigger_radius", (x, y, z + 30), 0, 50, 50);
	trigger_gobblegum setCursorHint("HINT_NOICON");
	trigger_gobblegum setHintString("^3[{+activate}]^7 to get a gobblegum (500 points)");

	while (true)
	{
		trigger_gobblegum waittill("trigger", player);

		if (!player usebuttonpressed()) {
			wait 0.05;
			continue;
		}
	
		// Check if player already bought a gobblegum this round
		if (player.last_gobblegum_round == level.round_number) {
			player iprintlnbold("You can only purchase one gobblegum per round");
			wait 0.05;
			continue;
		}
	
		// Check if player has enough points to buy a gobblegum
		if (player.score < 500) {
			player iprintlnbold("You do not have enough points");
			wait 0.05;
			continue;
		}
	
		// Check if player currently has a gobblegum
		if (isdefined(player.gobblegum)) {
			player iprintlnbold("You already have a gobblegum");
			wait 0.05;
			continue;
		}
	
		// Subtract points and set gobblegum
		player.score = player.score - 500;
		player.gobblegum = get_random_gobblegum();
		player.last_gobblegum_round = level.round_number;
	
		// Create gobblegum hud if it does not exist
		if (!isdefined(player.gobblegum_hud)) {
			player create_gobblegum_hud(300, 0);
		}
	
		// Update the gobblegum hud items
		player update_gobblegum_hud(player.gobblegum);
	}
}

gobblegum_watcher()
{
	while (true)
	{
		if (!isdefined(self.gobblegum)) {
			wait 0.05;
			continue;
		}
	
		if (!self adsbuttonpressed() || !self usebuttonpressed()) {
			wait 0.05;
			continue;
		}

		self iprintlnbold("Activated gobblegum: " + self.gobblegum.name);
	
		self thread [[self.gobblegum.usefunc]]();
	
		self.gobblegum.uses_left = self.gobblegum.uses_left - 1;
		if (self.gobblegum.uses_left <= 0) {
			self.gobblegum = undefined;
		}
	
		self update_gobblegum_hud(self.gobblegum);
		wait 3;
	}
}

add_gobblegum(identifier, name, desc, uses, usefunc)
{
	gobblegum = spawnstruct();

	gobblegum.identifier = identifier;
	gobblegum.name = name;
	gobblegum.desc = desc;
	gobblegum.uses = uses;
	gobblegum.uses_left = uses;
	gobblegum.usefunc = usefunc;

	if (!isdefined(level.gobblegums)) {
		level.gobblegums = [];
	}

	level.gobblegums[level.gobblegums.size] = gobblegum;
}

get_random_gobblegum()
{
	return random(level.gobblegums);
}

get_specific_gobblegum(identifier)
{
	foreach (gum in level.gobblegums)
	{
		if (gum.identifier == identifier) {
			return gum;
		}
	}

	return false;
}

create_gobblegum_hud(xoffset, yoffset)
{
	self.gg_hud_name = ml_create_text(1.5, xoffset, yoffset, "");
	self.gg_hud_desc = ml_create_text(1.2, xoffset, yoffset + 20, "");
	self.gg_hud_uses = ml_create_text(1, xoffset, yoffset + 30, "");
}

update_gobblegum_hud(gobblegum)
{
	if (!isdefined(gobblegum)) {
		self.gg_hud_name ml_update_text("");
		self.gg_hud_desc ml_update_text("");
		self.gg_hud_uses ml_update_text("");
		return;
	}

	self.gg_hud_name ml_update_text(gobblegum.name);
	self.gg_hud_desc ml_update_text(gobblegum.desc);
	self.gg_hud_uses ml_update_text(gobblegum.uses_left + "/" + gobblegum.uses);
}
