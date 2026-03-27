#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\zombies\_zm_utility;
// [player]ml_upgrade_weapon
ml_upgrade_weapon()
{
	weapon_name = self getcurrentweapon();
	if (issubstr(weapon_name, "upgraded_zm")) {
		return;
	}

	upgraded_weapon_name = maps\mp\zombies\_zm_weapons::get_upgrade_weapon(weapon_name, 1);

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

// ml_create_text:hud_elem
ml_create_text(font_size, xoffset, yoffset, text)
{
	hud_elem = createFontString("objective", font_size);
	hud_elem setPoint("CENTER", "CENTER", xoffset, yoffset);
	hud_elem.alpha = 1;
	hud_elem.hidewheninmenu = true;
	hud_elem.hidewhendead = true;
	hud_elem.color = (1, 1, 1);
	hud_elem setText(text);
	hud_elem.stored_text = text;
	return hud_elem;
}

ml_create_value(font_size, xoffset, yoffset, label)
{
	hud_elem = createFontString("objective", font_size);
	hud_elem setPoint("CENTER", "CENTER", xoffset, yoffset);
	hud_elem.alpha = 1;
	hud_elem.hidewheninmenu = true;
	hud_elem.hidewhendead = true;
	hud_elem.color = (1, 1, 1);
	hud_elem setValue(0);
	hud_elem.label = label;
	hud_elem.stored_value = 0;
	return hud_elem;
}

// [hud_elem]ml_update_text
ml_update_text(text)
{
	if (self.stored_text != text) {
		self setText(text);
		self.stored_text = text;
	}
}

ml_update_number(number)
{
	if (self.stored_value != number) {
		self setValue(number);
		self.stored_value = number;
	}
}

// ml_powerups:string[]
ml_powerups()
{
	return array("nuke", "insta_kill", "full_ammo", "double_points", "carpenter", "fire_sale", "free_perk");
}

// ml_perks:string[]
ml_perks()
{
	switch(level.script) {
		case "zm_tomb":
			return array("specialty_quickrevive", "specialty_armorvest", "specialty_fastreload", "specialty_rof", "specialty_longersprint", "specialty_deadshot", "specialty_additionalprimaryweapon", "specialty_grenadepulldeath");
		case "zm_prison":
			return array("specialty_armorvest", "specialty_fastreload", "specialty_rof", "specialty_quickrevive", "specialty_deadshot", "specialty_grenadepulldeath");
		case "zm_buried":
			return array("specialty_quickrevive", "specialty_armorvest", "specialty_fastreload", "specialty_rof", "specialty_longersprint", "specialty_deadshot", "specialty_scavenger");
		case "zm_highrise":
			return array("specialty_quickrevive", "specialty_armorvest", "specialty_fastreload", "specialty_rof", "specialty_additionalprimaryweapon", "specialty_who");
		case "zm_transit":
			return array("specialty_quickrevive", "specialty_armorvest", "specialty_fastreload", "specialty_rof", "specialty_longersprint");
		case "zm_nuked":
			return array("specialty_quickrevive", "specialty_armorvest", "specialty_fastreload", "specialty_rof", "specialty_longersprint", "specialty_deadshot");
		default:
			return array("");
	}
}

ml_base_weapons()
{
	switch(level.script) {
		case "zm_tomb":
			return array(
				"870mcs_zm",
				"ak74u_extclip_zm",
				"ak74u_zm",
				"ballista_zm",
				"beretta93r_extclip_zm",
				"beretta93r_zm",
				"c96_zm",
				"dsr50_zm",
				"evoskorpion_zm",
				"fiveseven_zm",
				"fivesevendw_zm",
				"fivesevenlh_zm",
				"fnfal_zm",
				"galil_zm",
				"hamr_zm",
				"kard_zm",
				"knife_zm",
				"ksg_zm",
				"m14_zm",
				"m32_zm",
				"mg08_zm",
				"mp40_stalker_zm",
				"mp40_zm",
				"mp44_zm",
				"pdw57_zm",
				"python_zm",
				"qcw05_zm",
				"ray_gun_zm",
				"raygun_mark2_zm",
				"scar_zm",
				"srm1216_zm",
				"thompson_zm",
				"type95_zm"
			);
	
		case "zm_prison":
			return array(
				"870mcs_zm",
				"ak47_zm",
				"barretm82_zm",
				"beretta93r_zm",
				"dsr50_zm",
				"fiveseven_zm",
				"fivesevendw_zm",
				"fivesevenlh_zm",
				"fnfal_zm",
				"galil_zm",
				"gl_tar21_zm",
				"judge_zm",
				"lsat_zm",
				"m14_zm",
				"m1911_zm",
				"minigun_alcatraz_zm",
				"mp5k_zm",
				"pdw57_zm",
				"rottweil72_zm",
				"saiga12_zm",
				"tar21_zm",
				"thompson_zm",
				"usrpg_zm",
				"uzi_zm",
				"willy_pete_zm"
			);
	
		case "zm_transit":
			return array(
				"870mcs_zm",
				"ak74u_zm",
				"barretm82_zm",
				"beretta93r_zm",
				"dsr50_zm",
				"fiveseven_zm",
				"fivesevendw_zm",
				"fivesevenlh_zm",
				"fnfal_zm",
				"galil_zm",
				"gl_tar21_zm",
				"gl_type95_zm",
				"gl_xm8_zm",
				"hamr_zm",
				"judge_zm",
				"kard_zm",
				"m14_zm",
				"m16_zm",
				"m1911_zm",
				"m32_zm",
				"mp5k_zm",
				"python_zm",
				"qcw05_zm",
				"rottweil72_zm",
				"rpd_zm",
				"saiga12_zm",
				"saritch_zm",
				"srm1216_zm",
				"tar21_zm",
				"type95_zm",
				"usrpg_zm",
				"xm8_zm"
			);
	
		case "zm_buried":
			return array(
				"870mcs_zm",
				"ak74u_zm",
				"an94_zm",
				"barretm82_zm",
				"beretta93r_zm",
				"dsr50_zm",
				"fiveseven_zm",
				"fivesevendw_zm",
				"fivesevenlh_zm",
				"fnfal_zm",
				"galil_zm",
				"gl_tar21_zm",
				"hamr_zm",
				"judge_zm",
				"kard_zm",
				"lsat_zm",
				"m14_zm",
				"m16_zm",
				"m1911_zm",
				"m32_zm",
				"mp5k_zm",
				"pdw57_zm",
				"rnma_zm",
				"rottweil72_zm",
				"saiga12_zm",
				"saritch_zm",
				"srm1216_zm",
				"svu_zm",
				"tar21_zm",
				"usrpg_zm"
			);
	
		case "zm_nuked":
			return array(
				"870mcs_zm",
				"ak74u_zm",
				"barretm82_zm",
				"beretta93r_zm",
				"dsr50_zm",
				"fiveseven_zm",
				"fivesevendw_zm",
				"fivesevenlh_zm",
				"fnfal_zm",
				"galil_zm",
				"gl_tar21_zm",
				"gl_type95_zm",
				"gl_xm8_zm",
				"hamr_zm",
				"hk416_zm",
				"judge_zm",
				"kard_zm",
				"lsat_zm",
				"m14_zm",
				"m16_zm",
				"m1911_zm",
				"m32_zm",
				"mp5k_zm",
				"python_zm",
				"qcw05_zm",
				"rottweil72_zm",
				"rpd_zm",
				"saiga12_zm",
				"saritch_zm",
				"srm1216_zm",
				"tar21_zm",
				"type95_zm",
				"usrpg_zm",
				"xm8_zm"
			);
	
		case "zm_highrise":
			return array(
				"870mcs_zm",
				"ak74u_zm",
				"an94_zm",
				"barretm82_zm",
				"beretta93r_zm",
				"dsr50_zm",
				"fiveseven_zm",
				"fivesevendw_zm",
				"fivesevenlh_zm",
				"fnfal_zm",
				"galil_zm",
				"gl_tar21_zm",
				"gl_type95_zm",
				"gl_xm8_zm",
				"hamr_zm",
				"judge_zm",
				"kard_zm",
				"m14_zm",
				"m16_zm",
				"m1911_zm",
				"m32_zm",
				"mp5k_zm",
				"pdw57_zm",
				"python_zm",
				"qcw05_zm",
				"ray_gun_zm",
				"rottweil72_zm",
				"rpd_zm",
				"saiga12_zm",
				"saritch_zm",
				"srm1216_zm",
				"svu_zm",
				"syrette_zm",
				"tar21_zm",
				"type95_zm",
				"usrpg_zm",
				"xm8_zm"
			);
	
		default:
			return array("");
	}
}

ml_upgraded_weapons()
{
	switch(level.script) {
		case "zm_tomb":
			array(
				"870mcs_upgraded_zm",
				"ak74u_extclip_upgraded_zm",
				"ak74u_upgraded_zm",
				"ballista_upgraded_zm",
				"beretta93r_extclip_upgraded_zm",
				"beretta93r_upgraded_zm",
				"c96_upgraded_zm",
				"dsr50_upgraded_zm",
				"evoskorpion_upgraded_zm",
				"fiveseven_upgraded_zm",
				"fivesevendw_upgraded_zm",
				"fivesevenlh_upgraded_zm",
				"fnfal_upgraded_zm",
				"galil_upgraded_zm",
				"hamr_upgraded_zm",
				"kard_upgraded_zm",
				"ksg_upgraded_zm",
				"m14_upgraded_zm",
				"m32_upgraded_zm",
				"mg08_upgraded_zm",
				"mp40_stalker_upgraded_zm",
				"mp40_upgraded_zm",
				"mp44_upgraded_zm",
				"pdw57_upgraded_zm",
				"python_upgraded_zm",
				"qcw05_upgraded_zm",
				"scar_upgraded_zm",
				"sf_qcw05_upgraded_zm",
				"srm1216_upgraded_zm",
				"thompson_upgraded_zm",
				"type95_upgraded_zm"
			);
	
		case "zm_prison":
			return array(
				"870mcs_upgraded_zm",
				"ak47_upgraded_zm",
				"barretm82_upgraded_zm",
				"beretta93r_upgraded_zm",
				"dsr50_upgraded_zm",
				"fiveseven_upgraded_zm",
				"fivesevendw_upgraded_zm",
				"fivesevenlh_upgraded_zm",
				"fnfal_upgraded_zm",
				"galil_upgraded_zm",
				"judge_upgraded_zm",
				"lsat_upgraded_zm",
				"m14_upgraded_zm",
				"m1911_upgraded_zm",
				"m1911lh_upgraded_zm",
				"minigun_alcatraz_upgraded_zm",
				"mp5k_upgraded_zm",
				"pdw57_upgraded_zm",
				"rottweil72_upgraded_zm",
				"saiga12_upgraded_zm",
				"tar21_upgraded_zm",
				"thompson_upgraded_zm",
				"usrpg_upgraded_zm",
				"uzi_upgraded_zm"
			);
	
		case "zm_buried":
			return array(
				"870mcs_upgraded_zm",
				"ak74u_upgraded_zm",
				"an94_upgraded_zm",
				"barretm82_upgraded_zm",
				"beretta93r_upgraded_zm",
				"dsr50_upgraded_zm",
				"dualoptic_saritch_upgraded_zm",
				"fiveseven_upgraded_zm",
				"fivesevendw_upgraded_zm",
				"fivesevenlh_upgraded_zm",
				"fnfal_upgraded_zm",
				"galil_upgraded_zm",
				"gl_m16_upgraded_zm",
				"hamr_upgraded_zm",
				"judge_upgraded_zm",
				"kard_upgraded_zm",
				"lsat_upgraded_zm",
				"m14_upgraded_zm",
				"m16_gl_upgraded_zm",
				"m1911_upgraded_zm",
				"m1911lh_upgraded_zm",
				"m32_upgraded_zm",
				"mp5k_upgraded_zm",
				"pdw57_upgraded_zm",
				"rnma_upgraded_zm",
				"rottweil72_upgraded_zm",
				"saiga12_upgraded_zm",
				"saritch_upgraded_zm",
				"srm1216_upgraded_zm",
				"svu_upgraded_zm",
				"tar21_upgraded_zm",
				"usrpg_upgraded_zm"
			);
	
		case "zm_nuked":
			return array(
				"870mcs_upgraded_zm",
				"ak74u_upgraded_zm",
				"barretm82_upgraded_zm",
				"beretta93r_upgraded_zm",
				"dsr50_upgraded_zm",
				"dualoptic_saritch_upgraded_zm",
				"fiveseven_upgraded_zm",
				"fivesevendw_upgraded_zm",
				"fivesevenlh_upgraded_zm",
				"fnfal_upgraded_zm",
				"galil_upgraded_zm",
				"gl_m16_upgraded_zm",
				"hamr_upgraded_zm",
				"hk416_upgraded_zm",
				"judge_upgraded_zm",
				"kard_upgraded_zm",
				"lsat_upgraded_zm",
				"m14_upgraded_zm",
				"m16_gl_upgraded_zm",
				"m1911_upgraded_zm",
				"m1911lh_upgraded_zm",
				"m32_upgraded_zm",
				"mp5k_upgraded_zm",
				"python_upgraded_zm",
				"qcw05_upgraded_zm",
				"rottweil72_upgraded_zm",
				"rpd_upgraded_zm",
				"saiga12_upgraded_zm",
				"saritch_upgraded_zm",
				"sf_qcw05_upgraded_zm",
				"srm1216_upgraded_zm",
				"tar21_upgraded_zm",
				"type95_upgraded_zm",
				"usrpg_upgraded_zm",
				"xm8_upgraded_zm"
			);
	
		case "zm_highrise":
			return array(
				"870mcs_upgraded_zm",
				"ak74u_upgraded_zm",
				"an94_upgraded_zm",
				"barretm82_upgraded_zm",
				"beretta93r_upgraded_zm",
				"dsr50_upgraded_zm",
				"dualoptic_saritch_upgraded_zm",
				"fiveseven_upgraded_zm",
				"fivesevendw_upgraded_zm",
				"fivesevenlh_upgraded_zm",
				"fnfal_upgraded_zm",
				"galil_upgraded_zm",
				"gl_m16_upgraded_zm",
				"hamr_upgraded_zm",
				"judge_upgraded_zm",
				"kard_upgraded_zm",
				"m14_upgraded_zm",
				"m16_gl_upgraded_zm",
				"m1911_upgraded_zm",
				"m1911lh_upgraded_zm",
				"m32_upgraded_zm",
				"mp5k_upgraded_zm",
				"pdw57_upgraded_zm",
				"python_upgraded_zm",
				"qcw05_upgraded_zm",
				"rottweil72_upgraded_zm",
				"rpd_upgraded_zm",
				"saiga12_upgraded_zm",
				"saritch_upgraded_zm",
				"sf_qcw05_upgraded_zm",
				"srm1216_upgraded_zm",
				"svu_upgraded_zm",
				"tar21_upgraded_zm",
				"type95_upgraded_zm",
				"usrpg_upgraded_zm",
				"xm8_upgraded_zm"
			);
	
		case "zm_transit":
			return array(
				"870mcs_upgraded_zm",
				"ak74u_upgraded_zm",
				"barretm82_upgraded_zm",
				"beretta93r_upgraded_zm",
				"dsr50_upgraded_zm",
				"dualoptic_saritch_upgraded_zm",
				"fiveseven_upgraded_zm",
				"fivesevendw_upgraded_zm",
				"fivesevenlh_upgraded_zm",
				"fnfal_upgraded_zm",
				"galil_upgraded_zm",
				"gl_m16_upgraded_zm",
				"hamr_upgraded_zm",
				"judge_upgraded_zm",
				"kard_upgraded_zm",
				"m14_upgraded_zm",
				"m16_gl_upgraded_zm",
				"m1911_upgraded_zm",
				"m1911lh_upgraded_zm",
				"m32_upgraded_zm",
				"mp5k_upgraded_zm",
				"python_upgraded_zm",
				"qcw05_upgraded_zm",
				"rottweil72_upgraded_zm",
				"rpd_upgraded_zm",
				"saiga12_upgraded_zm",
				"saritch_upgraded_zm",
				"sf_qcw05_upgraded_zm",
				"srm1216_upgraded_zm",
				"tar21_upgraded_zm",
				"type95_upgraded_zm",
				"usrpg_upgraded_zm",
				"xm8_upgraded_zm"
			);
	
		default:
			return array("");
	}
}

ml_base_special_weapons()
{
	switch(level.script) {
		case "zm_tomb":
			array(
				"one_inch_punch_air_zm",
				"one_inch_punch_fire_zm",
				"one_inch_punch_ice_zm",
				"one_inch_punch_lightning_zm",
				"one_inch_punch_zm",
				"ray_gun_zm",
				"raygun_mark2_zm",
				"staff_air_melee_zm",
				"staff_air_zm",
				"staff_fire_melee_zm",
				"staff_fire_zm",
				"staff_lightning_melee_zm",
				"staff_lightning_zm",
				"staff_revive_zm",
				"staff_water_dart_zm",
				"staff_water_fake_dart_zm",
				"staff_water_melee_zm",
				"staff_water_zm"
			);
	
		case "zm_prison":
			return array(
				"blundergat_zm",
				"blundersplat_bullet_zm",
				"blundersplat_explosive_dart_zm",
				"blundersplat_zm",
				"bouncing_tomahawk_zm",
				"ray_gun_zm"
			);
	
		case "zm_buried":
			return array(
				"ray_gun_zm",
				"raygun_mark2_zm",
				"slowgun_zm"
			);
	
		case "zm_nuked":
			return array(
				"ray_gun_zm"
			);
	
		case "zm_highrise":
			return array(
				"ray_gun_zm",
				"slipgun_zm"
			);
	
		case "zm_transit":
			return array(
				"jetgun_zm",
				"ray_gun_zm"
			);
	
		default:
			return array("");
	}
}

ml_upgraded_special_weapons()
{
	switch(level.script) {
		case "zm_tomb":
			array(
				"one_inch_punch_upgraded_zm",
				"ray_gun_upgraded_zm",
				"raygun_mark2_upgraded_zm",
				"staff_air_upgraded_zm",
				"staff_fire_upgraded_zm",
				"staff_lightning_upgraded_zm",
				"staff_water_upgraded_zm"
			);
	
		case "zm_prison":
			return array(
				"blundergat_upgraded_zm",
				"blundersplat_upgraded_zm",
				"ray_gun_upgraded_zm",
				"upgraded_tomahawk_zm"
			);
	
		case "zm_buried":
			return array(
				"ray_gun_upgraded_zm",
				"raygun_mark2_upgraded_zm",
				"slowgun_upgraded_zm"
			);
	
		case "zm_nuked":
			return array(
				"ray_gun_upgraded_zm"
			);
	
		case "zm_highrise":
			return array(
				"ray_gun_upgraded_zm",
				"slipgun_upgraded_zm"
			);
	
		case "zm_transit":
			return array(
				"jetgun_upgraded_zm",
				"ray_gun_upgraded_zm"
			);
	
		default:
			return array("");
	}
}

ml_flatten(arrs)
{
	output = array();

	foreach (arr in arrs)
	{
		foreach (i in arr)
		{
			output[output.size] = i;
		}
	}
}
