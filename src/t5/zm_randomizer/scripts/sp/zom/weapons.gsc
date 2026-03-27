#include common_scripts\utility;
#include scripts\sp\zom\maxlib;

init()
{
	level thread precache_weapons();

	flag_wait("all_players_connected");

	players = getplayers();

	for (i = 0; i < players.size; i = i + 1)
	{
		players[i] thread set_loadout();
	}
}

precache_weapons()
{
	// Precache base weapons
	weapons = get_base_weapons();
	for (i = 0; i < weapons.size; i = i + 1)
	{
		precacheitem(weapons[i]);
	}

	// Precache wonder weapons
	weapons = get_base_wonder_weapons();
	for (i = 0; i < weapons.size; i = i + 1)
	{
		precacheitem(weapons[i]);
	}

	// Precache grenades
	weapons = get_grenades();
	for (i = 0; i < weapons.size; i = i + 1)
	{
		precacheitem(weapons[i]);
	}
}

set_loadout()
{
	wait 0.5;
	self ml_take_all_weapons();

	base_weapons = get_base_weapons();
	upgraded_weapons = get_upgraded_weapons();
	base_wonder_weapons = get_base_wonder_weapons();
	upgraded_wonder_weapons = get_upgraded_wonder_weapons();

	wonder_weapons = array_combine(base_wonder_weapons, upgraded_wonder_weapons);

	//self iprintln("base_weapons.size=" + base_weapons.size);
	//self iprintln("upgraded_weapons.size=" + upgraded_weapons.size);
	//self iprintln("base_wonder_weapons.size=" + base_wonder_weapons.size);
	//self iprintln("upgraded_wonder_weapons.size=" + upgraded_wonder_weapons.size);

	for (i = 0; i < 2; i = i + 1)
	{
		weapon_name = "";
		d = randomint(10);
		if (d < 1) {
			weapon_name = wonder_weapons[randomint(wonder_weapons.size)];
			wonder_weapons = array_remove(wonder_weapons, weapon_name);
		} else if (d >= 1 && d < 3) {
			weapon_name = upgraded_weapons[randomint(upgraded_weapons.size)];
			upgraded_weapons = array_remove(upgraded_weapons, weapon_name);
		} else {
			weapon_name = base_weapons[randomint(base_weapons.size)];
			base_weapons = array_remove(base_weapons, weapon_name);
		}
	
		msg = "weapon[" + i + "]: " + weapon_name;
		self iprintln(msg);
	
		self maps\_zombiemode_weapons::weapon_give(weapon_name, issubstr(weapon_name, "upgraded"));
	}

	// PERKS
	perks = [];
	perks[perks.size] = "specialty_armorvest";
	perks[perks.size] = "specialty_quickrevive";
	perks[perks.size] = "specialty_fastreload";
	perks[perks.size] = "specialty_rof";

	if (is_true(level.zombiemode_using_marathon_perk)) {
		perks[perks.size] = "specialty_longersprint";
	}

	if (is_true(level.zombiemode_using_divetonuke_perk)) {
		perks[perks.size] = "specialty_flakjacket";
	}

	if (is_true(level.zombiemode_using_deadshot_perk)) {
		perks[perks.size] = "specialty_deadshot";
	}

	if (is_true(level.zombiemode_using_additionalprimaryweapon_perk)) {
		perks[perks.size] = "specialty_additionalprimaryweapon";
	}

	for (i = 0; i < 4; i = i + 1)
	{
		perk = perks[randomint(perks.size)];
		self maps\_zombiemode_perks::give_perk(perk, 0);
		perks = array_remove(perks, perk);
	}
}

get_base_weapons()
{
	arr = [];
	arr = c_add_weapon(arr, "m1911");
	arr = c_add_weapon(arr, "python");
	arr = c_add_weapon(arr, "cz75");
	arr = c_add_weapon(arr, "ak74u");
	arr = c_add_weapon(arr, "mp5k");
	arr = c_add_weapon(arr, "mp40");
	arr = c_add_weapon(arr, "mpl");
	arr = c_add_weapon(arr, "pm63");
	arr = c_add_weapon(arr, "spectre");
	arr = c_add_weapon(arr, "cz75dw");
	arr = c_add_weapon(arr, "ithaca");
	arr = c_add_weapon(arr, "spas");
	arr = c_add_weapon(arr, "rottweil72");
	arr = c_add_weapon(arr, "hs10");
	arr = c_add_weapon(arr, "m14");
	arr = c_add_weapon(arr, "m16");
	arr = c_add_weapon(arr, "g11_lps");
	arr = c_add_weapon(arr, "famas");
	arr = c_add_weapon(arr, "galil");
	arr = c_add_weapon(arr, "commando");
	arr = c_add_weapon(arr, "fnfal");
	arr = c_add_weapon(arr, "dragunov");
	arr = c_add_weapon(arr, "l96a1");
	arr = c_add_weapon(arr, "rpk");
	arr = c_add_weapon(arr, "hk21");
	arr = c_add_weapon(arr, "m72_law");
	arr = c_add_weapon(arr, "china_lake");
	arr = c_add_weapon(arr, "crossbow_explosive");
	return arr;
}

get_upgraded_weapons()
{
	arr = [];
	arr = c_add_weapon(arr, "m1911", 1);
	arr = c_add_weapon(arr, "python", 1);
	arr = c_add_weapon(arr, "cz75", 1);
	arr = c_add_weapon(arr, "ak74u", 1);
	arr = c_add_weapon(arr, "mp5k", 1);
	arr = c_add_weapon(arr, "mp40", 1);
	arr = c_add_weapon(arr, "mpl", 1);
	arr = c_add_weapon(arr, "pm63", 1);
	arr = c_add_weapon(arr, "spectre", 1);
	arr = c_add_weapon(arr, "cz75dw", 1);
	arr = c_add_weapon(arr, "ithaca", 1);
	arr = c_add_weapon(arr, "spas", 1);
	arr = c_add_weapon(arr, "rottweil72", 1);
	arr = c_add_weapon(arr, "hs10", 1);
	arr = c_add_weapon(arr, "m14", 1);
	arr = c_add_weapon(arr, "m16", 1);
	arr = c_add_weapon(arr, "g11_lps", 1);
	arr = c_add_weapon(arr, "famas", 1);
	arr = c_add_weapon(arr, "galil", 1);
	arr = c_add_weapon(arr, "commando", 1);
	arr = c_add_weapon(arr, "fnfal", 1);
	arr = c_add_weapon(arr, "dragunov", 1);
	arr = c_add_weapon(arr, "l96a1", 1);
	arr = c_add_weapon(arr, "rpk", 1);
	arr = c_add_weapon(arr, "hk21", 1);
	arr = c_add_weapon(arr, "m72_law", 1);
	arr = c_add_weapon(arr, "china_lake", 1);
	arr = c_add_weapon(arr, "crossbow_explosive", 1);
	return arr;
}

get_grenades()
{
	arr = [];
	arr = c_add_weapon(arr, "frag_grenade");
	arr = c_add_weapon(arr, "sticky_grenade");
	arr = c_add_weapon(arr, "claymore");
	return arr;
}

get_base_wonder_weapons()
{
	arr = [];
	arr = c_add_weapon(arr, "ray_gun");
	arr = c_add_weapon(arr, "tesla_gun");
	arr = c_add_weapon(arr, "thundergun");
	arr = c_add_weapon(arr, "freezegun");

	return arr;
}

get_upgraded_wonder_weapons()
{
	arr = [];
	arr = c_add_weapon(arr, "ray_gun", 1);
	arr = c_add_weapon(arr, "tesla_gun", 1);
	arr = c_add_weapon(arr, "thundergun", 1);
	arr = c_add_weapon(arr, "freezegun", 1);
	return arr;
}

c_add_weapon(arr, weapon_name, upgraded)
{
	suffix = "_zm";

	if (isdefined(upgraded) && upgraded == true) {
		suffix = "_upgraded_zm";
	}

	if (isdefined(level.zombie_weapons) && isdefined(level.zombie_weapons[weapon_name+"_zm"])) {
		arr[arr.size] = weapon_name + suffix;
	}

	return arr;
}
