#include common_scripts\utility;
// [player]ml_upgrade_weapon
ml_upgrade_weapon()
{
	weapon_name = self getcurrentweapon();
	if (issubstr(weapon_name, "upgraded_zm")) {
		return;
	}

	upgraded_weapon_name = "";

	if (isdefined(level.zombie_weapons[weapon_name]) && isdefined(level.zombie_weapons[weapon_name].upgrade_name)) {
		upgraded_weapon_name = level.zombie_weapons[weapon_name].upgrade_name;
	} else {
		return;
	}

	self takeweapon(weapon_name);
	self giveweapon(upgraded_weapon_name);
}

// [player]ml_take_all_weapons
ml_take_all_weapons()
{
	weaponslist = self getweaponslist();
	for (i = 0; i < weaponslist.size; i = i + 1)
	{
		if (weaponslist[i] != "knife_zm") {
			self takeweapon(weaponslist[i]);
		}
	}
}

ml_give_weapon(weapon_name)
{
	self giveweapon(weapon_name);
	self givemaxammo(weapon_name);
	self switchtoweapon(weapon_name);
}

// ml_powerups:string[]
ml_powerups()
{
	arr = [];
	arr[arr.size] = "nuke";
	arr[arr.size] = "insta_kill";
	arr[arr.size] = "full_ammo";
	arr[arr.size] = "double_points";
	arr[arr.size] = "carpenter";
	arr[arr.size] = "fire_sale";
	arr[arr.size] = "free_perk";
	return arr;
}

// ml_perks:string[]
ml_perks()
{
	switch(level.script) {
		case "zm_tomb":
			arr = [];
			arr[arr.size] = "specialty_quickrevive";
			arr[arr.size] = "specialty_armorvest";
			arr[arr.size] = "specialty_fastreload";
			arr[arr.size] = "specialty_rof";
			arr[arr.size] = "specialty_longersprint";
			arr[arr.size] = "specialty_deadshot";
			arr[arr.size] = "specialty_additionalprimaryweapon";
			arr[arr.size] = "specialty_grenadepulldeath";
			return arr;
		case "zm_prison":
			arr = [];
			arr[arr.size] = "specialty_armorvest";
			arr[arr.size] = "specialty_fastreload";
			arr[arr.size] = "specialty_rof";
			arr[arr.size] = "specialty_quickrevive";
			arr[arr.size] = "specialty_deadshot";
			arr[arr.size] = "specialty_grenadepulldeath";
			return arr;
		case "zm_buried":
			arr = [];
			arr[arr.size] = "specialty_quickrevive";
			arr[arr.size] = "specialty_armorvest";
			arr[arr.size] = "specialty_fastreload";
			arr[arr.size] = "specialty_rof";
			arr[arr.size] = "specialty_longersprint";
			arr[arr.size] = "specialty_deadshot";
			arr[arr.size] = "specialty_scavenger";
			return arr;
		case "zm_highrise":
			arr = [];
			arr[arr.size] = "specialty_quickrevive";
			arr[arr.size] = "specialty_armorvest";
			arr[arr.size] = "specialty_fastreload";
			arr[arr.size] = "specialty_rof";
			arr[arr.size] = "specialty_additionalprimaryweapon";
			arr[arr.size] = "specialty_who";
			return arr;
		case "zm_transit":
			arr = [];
			arr[arr.size] = "specialty_quickrevive";
			arr[arr.size] = "specialty_armorvest";
			arr[arr.size] = "specialty_fastreload";
			arr[arr.size] = "specialty_rof";
			arr[arr.size] = "specialty_longersprint";
			return arr;
		case "zm_nuked":
			arr = [];
			arr[arr.size] = "specialty_quickrevive";
			arr[arr.size] = "specialty_armorvest";
			arr[arr.size] = "specialty_fastreload";
			arr[arr.size] = "specialty_rof";
			arr[arr.size] = "specialty_longersprint";
			arr[arr.size] = "specialty_deadshot";
			return arr;
		default:
			arr = [];
			arr[arr.size] = "";
			return arr;
	}
}

ml_base_weapons()
{
	switch(level.script) {
		case "zm_tomb":
			arr = [];
			arr[arr.size] = "870mcs_zm";
			arr[arr.size] = "ak74u_extclip_zm";
			arr[arr.size] = "ak74u_zm";
			arr[arr.size] = "ballista_zm";
			arr[arr.size] = "beretta93r_extclip_zm";
			arr[arr.size] = "beretta93r_zm";
			arr[arr.size] = "c96_zm";
			arr[arr.size] = "dsr50_zm";
			arr[arr.size] = "evoskorpion_zm";
			arr[arr.size] = "fiveseven_zm";
			arr[arr.size] = "fivesevendw_zm";
			arr[arr.size] = "fivesevenlh_zm";
			arr[arr.size] = "fnfal_zm";
			arr[arr.size] = "galil_zm";
			arr[arr.size] = "hamr_zm";
			arr[arr.size] = "kard_zm";
			arr[arr.size] = "knife_zm";
			arr[arr.size] = "ksg_zm";
			arr[arr.size] = "m14_zm";
			arr[arr.size] = "m32_zm";
			arr[arr.size] = "mg08_zm";
			arr[arr.size] = "mp40_stalker_zm";
			arr[arr.size] = "mp40_zm";
			arr[arr.size] = "mp44_zm";
			arr[arr.size] = "pdw57_zm";
			arr[arr.size] = "python_zm";
			arr[arr.size] = "qcw05_zm";
			arr[arr.size] = "ray_gun_zm";
			arr[arr.size] = "raygun_mark2_zm";
			arr[arr.size] = "scar_zm";
			arr[arr.size] = "srm1216_zm";
			arr[arr.size] = "thompson_zm";
			arr[arr.size] = "type95_zm";
			return arr;
	
		case "zm_prison":
			arr = [];
			arr[arr.size] = "870mcs_zm";
			arr[arr.size] = "ak47_zm";
			arr[arr.size] = "barretm82_zm";
			arr[arr.size] = "beretta93r_zm";
			arr[arr.size] = "dsr50_zm";
			arr[arr.size] = "fiveseven_zm";
			arr[arr.size] = "fivesevendw_zm";
			arr[arr.size] = "fivesevenlh_zm";
			arr[arr.size] = "fnfal_zm";
			arr[arr.size] = "galil_zm";
			arr[arr.size] = "gl_tar21_zm";
			arr[arr.size] = "judge_zm";
			arr[arr.size] = "lsat_zm";
			arr[arr.size] = "m14_zm";
			arr[arr.size] = "m1911_zm";
			arr[arr.size] = "minigun_alcatraz_zm";
			arr[arr.size] = "mp5k_zm";
			arr[arr.size] = "pdw57_zm";
			arr[arr.size] = "rottweil72_zm";
			arr[arr.size] = "saiga12_zm";
			arr[arr.size] = "tar21_zm";
			arr[arr.size] = "thompson_zm";
			arr[arr.size] = "usrpg_zm";
			arr[arr.size] = "uzi_zm";
			arr[arr.size] = "willy_pete_zm";
			return arr;
	
		case "zm_transit":
			arr = [];
			arr[arr.size] = "870mcs_zm";
			arr[arr.size] = "ak74u_zm";
			arr[arr.size] = "barretm82_zm";
			arr[arr.size] = "beretta93r_zm";
			arr[arr.size] = "dsr50_zm";
			arr[arr.size] = "fiveseven_zm";
			arr[arr.size] = "fivesevendw_zm";
			arr[arr.size] = "fivesevenlh_zm";
			arr[arr.size] = "fnfal_zm";
			arr[arr.size] = "galil_zm";
			arr[arr.size] = "gl_tar21_zm";
			arr[arr.size] = "gl_type95_zm";
			arr[arr.size] = "gl_xm8_zm";
			arr[arr.size] = "hamr_zm";
			arr[arr.size] = "judge_zm";
			arr[arr.size] = "kard_zm";
			arr[arr.size] = "m14_zm";
			arr[arr.size] = "m16_zm";
			arr[arr.size] = "m1911_zm";
			arr[arr.size] = "m32_zm";
			arr[arr.size] = "mp5k_zm";
			arr[arr.size] = "python_zm";
			arr[arr.size] = "qcw05_zm";
			arr[arr.size] = "rottweil72_zm";
			arr[arr.size] = "rpd_zm";
			arr[arr.size] = "saiga12_zm";
			arr[arr.size] = "saritch_zm";
			arr[arr.size] = "srm1216_zm";
			arr[arr.size] = "tar21_zm";
			arr[arr.size] = "type95_zm";
			arr[arr.size] = "usrpg_zm";
			arr[arr.size] = "xm8_zm";
			return arr;
	
		case "zm_buried":
			arr = [];
			arr[arr.size] = "870mcs_zm";
			arr[arr.size] = "ak74u_zm";
			arr[arr.size] = "an94_zm";
			arr[arr.size] = "barretm82_zm";
			arr[arr.size] = "beretta93r_zm";
			arr[arr.size] = "dsr50_zm";
			arr[arr.size] = "fiveseven_zm";
			arr[arr.size] = "fivesevendw_zm";
			arr[arr.size] = "fivesevenlh_zm";
			arr[arr.size] = "fnfal_zm";
			arr[arr.size] = "galil_zm";
			arr[arr.size] = "gl_tar21_zm";
			arr[arr.size] = "hamr_zm";
			arr[arr.size] = "judge_zm";
			arr[arr.size] = "kard_zm";
			arr[arr.size] = "lsat_zm";
			arr[arr.size] = "m14_zm";
			arr[arr.size] = "m16_zm";
			arr[arr.size] = "m1911_zm";
			arr[arr.size] = "m32_zm";
			arr[arr.size] = "mp5k_zm";
			arr[arr.size] = "pdw57_zm";
			arr[arr.size] = "rnma_zm";
			arr[arr.size] = "rottweil72_zm";
			arr[arr.size] = "saiga12_zm";
			arr[arr.size] = "saritch_zm";
			arr[arr.size] = "srm1216_zm";
			arr[arr.size] = "svu_zm";
			arr[arr.size] = "tar21_zm";
			arr[arr.size] = "usrpg_zm";
			return arr;
	
		case "zm_nuked":
			arr = [];
			arr[arr.size] = "870mcs_zm";
			arr[arr.size] = "ak74u_zm";
			arr[arr.size] = "barretm82_zm";
			arr[arr.size] = "beretta93r_zm";
			arr[arr.size] = "dsr50_zm";
			arr[arr.size] = "fiveseven_zm";
			arr[arr.size] = "fivesevendw_zm";
			arr[arr.size] = "fivesevenlh_zm";
			arr[arr.size] = "fnfal_zm";
			arr[arr.size] = "galil_zm";
			arr[arr.size] = "gl_tar21_zm";
			arr[arr.size] = "gl_type95_zm";
			arr[arr.size] = "gl_xm8_zm";
			arr[arr.size] = "hamr_zm";
			arr[arr.size] = "hk416_zm";
			arr[arr.size] = "judge_zm";
			arr[arr.size] = "kard_zm";
			arr[arr.size] = "lsat_zm";
			arr[arr.size] = "m14_zm";
			arr[arr.size] = "m16_zm";
			arr[arr.size] = "m1911_zm";
			arr[arr.size] = "m32_zm";
			arr[arr.size] = "mp5k_zm";
			arr[arr.size] = "python_zm";
			arr[arr.size] = "qcw05_zm";
			arr[arr.size] = "rottweil72_zm";
			arr[arr.size] = "rpd_zm";
			arr[arr.size] = "saiga12_zm";
			arr[arr.size] = "saritch_zm";
			arr[arr.size] = "srm1216_zm";
			arr[arr.size] = "tar21_zm";
			arr[arr.size] = "type95_zm";
			arr[arr.size] = "usrpg_zm";
			arr[arr.size] = "xm8_zm";
			return arr;
	
		case "zm_highrise":
			arr = [];
			arr[arr.size] = "870mcs_zm";
			arr[arr.size] = "ak74u_zm";
			arr[arr.size] = "an94_zm";
			arr[arr.size] = "barretm82_zm";
			arr[arr.size] = "beretta93r_zm";
			arr[arr.size] = "dsr50_zm";
			arr[arr.size] = "fiveseven_zm";
			arr[arr.size] = "fivesevendw_zm";
			arr[arr.size] = "fivesevenlh_zm";
			arr[arr.size] = "fnfal_zm";
			arr[arr.size] = "galil_zm";
			arr[arr.size] = "gl_tar21_zm";
			arr[arr.size] = "gl_type95_zm";
			arr[arr.size] = "gl_xm8_zm";
			arr[arr.size] = "hamr_zm";
			arr[arr.size] = "judge_zm";
			arr[arr.size] = "kard_zm";
			arr[arr.size] = "m14_zm";
			arr[arr.size] = "m16_zm";
			arr[arr.size] = "m1911_zm";
			arr[arr.size] = "m32_zm";
			arr[arr.size] = "mp5k_zm";
			arr[arr.size] = "pdw57_zm";
			arr[arr.size] = "python_zm";
			arr[arr.size] = "qcw05_zm";
			arr[arr.size] = "ray_gun_zm";
			arr[arr.size] = "rottweil72_zm";
			arr[arr.size] = "rpd_zm";
			arr[arr.size] = "saiga12_zm";
			arr[arr.size] = "saritch_zm";
			arr[arr.size] = "srm1216_zm";
			arr[arr.size] = "svu_zm";
			arr[arr.size] = "syrette_zm";
			arr[arr.size] = "tar21_zm";
			arr[arr.size] = "type95_zm";
			arr[arr.size] = "usrpg_zm";
			arr[arr.size] = "xm8_zm";
			return arr;
	
		default:
			arr = [];
			arr[arr.size] = "";
			return arr;
	}
}

ml_upgraded_weapons()
{
	switch(level.script) {
		case "zm_tomb":
			arr = [];
			arr[arr.size] = "870mcs_upgraded_zm";
			arr[arr.size] = "ak74u_extclip_upgraded_zm";
			arr[arr.size] = "ak74u_upgraded_zm";
			arr[arr.size] = "ballista_upgraded_zm";
			arr[arr.size] = "beretta93r_extclip_upgraded_zm";
			arr[arr.size] = "beretta93r_upgraded_zm";
			arr[arr.size] = "c96_upgraded_zm";
			arr[arr.size] = "dsr50_upgraded_zm";
			arr[arr.size] = "evoskorpion_upgraded_zm";
			arr[arr.size] = "fiveseven_upgraded_zm";
			arr[arr.size] = "fivesevendw_upgraded_zm";
			arr[arr.size] = "fivesevenlh_upgraded_zm";
			arr[arr.size] = "fnfal_upgraded_zm";
			arr[arr.size] = "galil_upgraded_zm";
			arr[arr.size] = "hamr_upgraded_zm";
			arr[arr.size] = "kard_upgraded_zm";
			arr[arr.size] = "ksg_upgraded_zm";
			arr[arr.size] = "m14_upgraded_zm";
			arr[arr.size] = "m32_upgraded_zm";
			arr[arr.size] = "mg08_upgraded_zm";
			arr[arr.size] = "mp40_stalker_upgraded_zm";
			arr[arr.size] = "mp40_upgraded_zm";
			arr[arr.size] = "mp44_upgraded_zm";
			arr[arr.size] = "pdw57_upgraded_zm";
			arr[arr.size] = "python_upgraded_zm";
			arr[arr.size] = "qcw05_upgraded_zm";
			arr[arr.size] = "scar_upgraded_zm";
			arr[arr.size] = "sf_qcw05_upgraded_zm";
			arr[arr.size] = "srm1216_upgraded_zm";
			arr[arr.size] = "thompson_upgraded_zm";
			arr[arr.size] = "type95_upgraded_zm";
			return arr;
	
		case "zm_prison":
			arr = [];
			arr[arr.size] = "870mcs_upgraded_zm";
			arr[arr.size] = "ak47_upgraded_zm";
			arr[arr.size] = "barretm82_upgraded_zm";
			arr[arr.size] = "beretta93r_upgraded_zm";
			arr[arr.size] = "dsr50_upgraded_zm";
			arr[arr.size] = "fiveseven_upgraded_zm";
			arr[arr.size] = "fivesevendw_upgraded_zm";
			arr[arr.size] = "fivesevenlh_upgraded_zm";
			arr[arr.size] = "fnfal_upgraded_zm";
			arr[arr.size] = "galil_upgraded_zm";
			arr[arr.size] = "judge_upgraded_zm";
			arr[arr.size] = "lsat_upgraded_zm";
			arr[arr.size] = "m14_upgraded_zm";
			arr[arr.size] = "m1911_upgraded_zm";
			arr[arr.size] = "m1911lh_upgraded_zm";
			arr[arr.size] = "minigun_alcatraz_upgraded_zm";
			arr[arr.size] = "mp5k_upgraded_zm";
			arr[arr.size] = "pdw57_upgraded_zm";
			arr[arr.size] = "rottweil72_upgraded_zm";
			arr[arr.size] = "saiga12_upgraded_zm";
			arr[arr.size] = "tar21_upgraded_zm";
			arr[arr.size] = "thompson_upgraded_zm";
			arr[arr.size] = "usrpg_upgraded_zm";
			arr[arr.size] = "uzi_upgraded_zm";
			return arr;
	
		case "zm_buried":
			arr = [];
			arr[arr.size] = "870mcs_upgraded_zm";
			arr[arr.size] = "ak74u_upgraded_zm";
			arr[arr.size] = "an94_upgraded_zm";
			arr[arr.size] = "barretm82_upgraded_zm";
			arr[arr.size] = "beretta93r_upgraded_zm";
			arr[arr.size] = "dsr50_upgraded_zm";
			arr[arr.size] = "dualoptic_saritch_upgraded_zm";
			arr[arr.size] = "fiveseven_upgraded_zm";
			arr[arr.size] = "fivesevendw_upgraded_zm";
			arr[arr.size] = "fivesevenlh_upgraded_zm";
			arr[arr.size] = "fnfal_upgraded_zm";
			arr[arr.size] = "galil_upgraded_zm";
			arr[arr.size] = "gl_m16_upgraded_zm";
			arr[arr.size] = "hamr_upgraded_zm";
			arr[arr.size] = "judge_upgraded_zm";
			arr[arr.size] = "kard_upgraded_zm";
			arr[arr.size] = "lsat_upgraded_zm";
			arr[arr.size] = "m14_upgraded_zm";
			arr[arr.size] = "m16_gl_upgraded_zm";
			arr[arr.size] = "m1911_upgraded_zm";
			arr[arr.size] = "m1911lh_upgraded_zm";
			arr[arr.size] = "m32_upgraded_zm";
			arr[arr.size] = "mp5k_upgraded_zm";
			arr[arr.size] = "pdw57_upgraded_zm";
			arr[arr.size] = "rnma_upgraded_zm";
			arr[arr.size] = "rottweil72_upgraded_zm";
			arr[arr.size] = "saiga12_upgraded_zm";
			arr[arr.size] = "saritch_upgraded_zm";
			arr[arr.size] = "srm1216_upgraded_zm";
			arr[arr.size] = "svu_upgraded_zm";
			arr[arr.size] = "tar21_upgraded_zm";
			arr[arr.size] = "usrpg_upgraded_zm";
			return arr;
	
		case "zm_nuked":
			arr = [];
			arr[arr.size] = "870mcs_upgraded_zm";
			arr[arr.size] = "ak74u_upgraded_zm";
			arr[arr.size] = "barretm82_upgraded_zm";
			arr[arr.size] = "beretta93r_upgraded_zm";
			arr[arr.size] = "dsr50_upgraded_zm";
			arr[arr.size] = "dualoptic_saritch_upgraded_zm";
			arr[arr.size] = "fiveseven_upgraded_zm";
			arr[arr.size] = "fivesevendw_upgraded_zm";
			arr[arr.size] = "fivesevenlh_upgraded_zm";
			arr[arr.size] = "fnfal_upgraded_zm";
			arr[arr.size] = "galil_upgraded_zm";
			arr[arr.size] = "gl_m16_upgraded_zm";
			arr[arr.size] = "hamr_upgraded_zm";
			arr[arr.size] = "hk416_upgraded_zm";
			arr[arr.size] = "judge_upgraded_zm";
			arr[arr.size] = "kard_upgraded_zm";
			arr[arr.size] = "lsat_upgraded_zm";
			arr[arr.size] = "m14_upgraded_zm";
			arr[arr.size] = "m16_gl_upgraded_zm";
			arr[arr.size] = "m1911_upgraded_zm";
			arr[arr.size] = "m1911lh_upgraded_zm";
			arr[arr.size] = "m32_upgraded_zm";
			arr[arr.size] = "mp5k_upgraded_zm";
			arr[arr.size] = "python_upgraded_zm";
			arr[arr.size] = "qcw05_upgraded_zm";
			arr[arr.size] = "rottweil72_upgraded_zm";
			arr[arr.size] = "rpd_upgraded_zm";
			arr[arr.size] = "saiga12_upgraded_zm";
			arr[arr.size] = "saritch_upgraded_zm";
			arr[arr.size] = "sf_qcw05_upgraded_zm";
			arr[arr.size] = "srm1216_upgraded_zm";
			arr[arr.size] = "tar21_upgraded_zm";
			arr[arr.size] = "type95_upgraded_zm";
			arr[arr.size] = "usrpg_upgraded_zm";
			arr[arr.size] = "xm8_upgraded_zm";
			return arr;
	
		case "zm_highrise":
			arr = [];
			arr[arr.size] = "870mcs_upgraded_zm";
			arr[arr.size] = "ak74u_upgraded_zm";
			arr[arr.size] = "an94_upgraded_zm";
			arr[arr.size] = "barretm82_upgraded_zm";
			arr[arr.size] = "beretta93r_upgraded_zm";
			arr[arr.size] = "dsr50_upgraded_zm";
			arr[arr.size] = "dualoptic_saritch_upgraded_zm";
			arr[arr.size] = "fiveseven_upgraded_zm";
			arr[arr.size] = "fivesevendw_upgraded_zm";
			arr[arr.size] = "fivesevenlh_upgraded_zm";
			arr[arr.size] = "fnfal_upgraded_zm";
			arr[arr.size] = "galil_upgraded_zm";
			arr[arr.size] = "gl_m16_upgraded_zm";
			arr[arr.size] = "hamr_upgraded_zm";
			arr[arr.size] = "judge_upgraded_zm";
			arr[arr.size] = "kard_upgraded_zm";
			arr[arr.size] = "m14_upgraded_zm";
			arr[arr.size] = "m16_gl_upgraded_zm";
			arr[arr.size] = "m1911_upgraded_zm";
			arr[arr.size] = "m1911lh_upgraded_zm";
			arr[arr.size] = "m32_upgraded_zm";
			arr[arr.size] = "mp5k_upgraded_zm";
			arr[arr.size] = "pdw57_upgraded_zm";
			arr[arr.size] = "python_upgraded_zm";
			arr[arr.size] = "qcw05_upgraded_zm";
			arr[arr.size] = "rottweil72_upgraded_zm";
			arr[arr.size] = "rpd_upgraded_zm";
			arr[arr.size] = "saiga12_upgraded_zm";
			arr[arr.size] = "saritch_upgraded_zm";
			arr[arr.size] = "sf_qcw05_upgraded_zm";
			arr[arr.size] = "srm1216_upgraded_zm";
			arr[arr.size] = "svu_upgraded_zm";
			arr[arr.size] = "tar21_upgraded_zm";
			arr[arr.size] = "type95_upgraded_zm";
			arr[arr.size] = "usrpg_upgraded_zm";
			arr[arr.size] = "xm8_upgraded_zm";
			return arr;
	
		case "zm_transit":
			arr = [];
			arr[arr.size] = "870mcs_upgraded_zm";
			arr[arr.size] = "ak74u_upgraded_zm";
			arr[arr.size] = "barretm82_upgraded_zm";
			arr[arr.size] = "beretta93r_upgraded_zm";
			arr[arr.size] = "dsr50_upgraded_zm";
			arr[arr.size] = "dualoptic_saritch_upgraded_zm";
			arr[arr.size] = "fiveseven_upgraded_zm";
			arr[arr.size] = "fivesevendw_upgraded_zm";
			arr[arr.size] = "fivesevenlh_upgraded_zm";
			arr[arr.size] = "fnfal_upgraded_zm";
			arr[arr.size] = "galil_upgraded_zm";
			arr[arr.size] = "gl_m16_upgraded_zm";
			arr[arr.size] = "hamr_upgraded_zm";
			arr[arr.size] = "judge_upgraded_zm";
			arr[arr.size] = "kard_upgraded_zm";
			arr[arr.size] = "m14_upgraded_zm";
			arr[arr.size] = "m16_gl_upgraded_zm";
			arr[arr.size] = "m1911_upgraded_zm";
			arr[arr.size] = "m1911lh_upgraded_zm";
			arr[arr.size] = "m32_upgraded_zm";
			arr[arr.size] = "mp5k_upgraded_zm";
			arr[arr.size] = "python_upgraded_zm";
			arr[arr.size] = "qcw05_upgraded_zm";
			arr[arr.size] = "rottweil72_upgraded_zm";
			arr[arr.size] = "rpd_upgraded_zm";
			arr[arr.size] = "saiga12_upgraded_zm";
			arr[arr.size] = "saritch_upgraded_zm";
			arr[arr.size] = "sf_qcw05_upgraded_zm";
			arr[arr.size] = "srm1216_upgraded_zm";
			arr[arr.size] = "tar21_upgraded_zm";
			arr[arr.size] = "type95_upgraded_zm";
			arr[arr.size] = "usrpg_upgraded_zm";
			arr[arr.size] = "xm8_upgraded_zm";
			return arr;
	
		default:
			arr = [];
			arr[arr.size] = "";
			return arr;
	}
}

ml_base_special_weapons()
{
	switch(level.script) {
		case "zm_tomb":
			arr = [];
			arr[arr.size] = "one_inch_punch_air_zm";
			arr[arr.size] = "one_inch_punch_fire_zm";
			arr[arr.size] = "one_inch_punch_ice_zm";
			arr[arr.size] = "one_inch_punch_lightning_zm";
			arr[arr.size] = "one_inch_punch_zm";
			arr[arr.size] = "ray_gun_zm";
			arr[arr.size] = "raygun_mark2_zm";
			arr[arr.size] = "staff_air_melee_zm";
			arr[arr.size] = "staff_air_zm";
			arr[arr.size] = "staff_fire_melee_zm";
			arr[arr.size] = "staff_fire_zm";
			arr[arr.size] = "staff_lightning_melee_zm";
			arr[arr.size] = "staff_lightning_zm";
			arr[arr.size] = "staff_revive_zm";
			arr[arr.size] = "staff_water_dart_zm";
			arr[arr.size] = "staff_water_fake_dart_zm";
			arr[arr.size] = "staff_water_melee_zm";
			arr[arr.size] = "staff_water_zm";
			return arr;
	
		case "zm_prison":
			arr = [];
			arr[arr.size] = "blundergat_zm";
			arr[arr.size] = "blundersplat_bullet_zm";
			arr[arr.size] = "blundersplat_explosive_dart_zm";
			arr[arr.size] = "blundersplat_zm";
			arr[arr.size] = "bouncing_tomahawk_zm";
			arr[arr.size] = "ray_gun_zm";
			return arr;
	
		case "zm_buried":
			arr = [];
			arr[arr.size] = "ray_gun_zm";
			arr[arr.size] = "raygun_mark2_zm";
			arr[arr.size] = "slowgun_zm";
			return arr;
	
		case "zm_nuked":
			arr = [];
			arr[arr.size] = "ray_gun_zm";
			return arr;
	
		case "zm_highrise":
			arr = [];
			arr[arr.size] = "ray_gun_zm";
			arr[arr.size] = "slipgun_zm";
			return arr;
	
		case "zm_transit":
			arr = [];
			arr[arr.size] = "jetgun_zm";
			arr[arr.size] = "ray_gun_zm";
			return arr;
	
		default:
			arr = [];
			arr[arr.size] = "";
			return arr;
	}
}

ml_upgraded_special_weapons()
{
	switch(level.script) {
		case "zm_tomb":
			arr = [];
			arr[arr.size] = "one_inch_punch_upgraded_zm";
			arr[arr.size] = "ray_gun_upgraded_zm";
			arr[arr.size] = "raygun_mark2_upgraded_zm";
			arr[arr.size] = "staff_air_upgraded_zm";
			arr[arr.size] = "staff_fire_upgraded_zm";
			arr[arr.size] = "staff_lightning_upgraded_zm";
			arr[arr.size] = "staff_water_upgraded_zm";
			return arr;
	
		case "zm_prison":
			arr = [];
			arr[arr.size] = "blundergat_upgraded_zm";
			arr[arr.size] = "blundersplat_upgraded_zm";
			arr[arr.size] = "ray_gun_upgraded_zm";
			arr[arr.size] = "upgraded_tomahawk_zm";
			return arr;
	
		case "zm_buried":
			arr = [];
			arr[arr.size] = "ray_gun_upgraded_zm";
			arr[arr.size] = "raygun_mark2_upgraded_zm";
			arr[arr.size] = "slowgun_upgraded_zm";
			return arr;
	
		case "zm_nuked":
			arr = [];
			arr[arr.size] = "ray_gun_upgraded_zm";
			return arr;
	
		case "zm_highrise":
			arr = [];
			arr[arr.size] = "ray_gun_upgraded_zm";
			arr[arr.size] = "slipgun_upgraded_zm";
			return arr;
	
		case "zm_transit":
			arr = [];
			arr[arr.size] = "jetgun_upgraded_zm";
			arr[arr.size] = "ray_gun_upgraded_zm";
			return arr;
	
		default:
			arr = [];
			arr[arr.size] = "";
			return arr;
	}
}
