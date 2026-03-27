#include scripts\zm\maxlib;
#include scripts\zm\gobblegums;

init()
{
	add_gobblegum("in_plain_sight", "In Plain Sight", "Zombies ignore the player for 10 seconds.", 3, ::gg_in_plain_sight);
	add_gobblegum("cache_back", "Cache Back", "Drops a max ammo.", 3, ::gg_cache_back);
	add_gobblegum("multiplier", "Multiplier", "Drops a 2x points.", 3, ::gg_multiplier);
	add_gobblegum("perkdrop", "Perk Drop", "Drops a free perk.", 1, ::gg_perkdrop);
	add_gobblegum("weapon_upgrade", "Weapon Upgrade", "Upgrades the current held weapon.", 1, ::gg_weapon_upgrade);
	add_gobblegum("perkaholic", "Perkaholic", "Gives all perks.", 1, ::gg_perkaholic);
	add_gobblegum("killjoy", "Kill Joy", "Drops an insta-kill", 3, ::gg_killjoy);

	thread add_gobblegum_machine(2381, 4752, -301);
}

gg_in_plain_sight()
{
	self.ignoreme = true;
	wait 10;
	self.ignoreme = false;
}

gg_cache_back()
{
	self maps\mp\zombies\_zm_powerups::specific_powerup_drop("full_ammo", self.origin);
}

gg_multiplier()
{
	self maps\mp\zombies\_zm_powerups::specific_powerup_drop("double_points", self.origin);
}

gg_perkdrop()
{
	self maps\mp\zombies\_zm_powerups::specific_powerup_drop("free_perk", self.origin);
}

gg_weapon_upgrade()
{
	self ml_upgrade_weapon();
}

gg_perkaholic()
{
	foreach (perk in ml_perks())
	{
		self maps\mp\zombies\_zm_perks::give_perk(perk);
	}
}

gg_killjoy()
{
	self maps\mp\zombies\_zm_powerups::specific_powerup_drop("insta_kill", self.origin);
}
