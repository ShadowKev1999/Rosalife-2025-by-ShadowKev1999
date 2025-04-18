#define SAMP_COMPAT
#include <open.mp>
#include <samp_bcrypt>
#include <Pawn.CMD>
#include <sscanf2>
#define YSI_NO_HEAP_MALLOC
#define YSI_NO_OPTIMISATION_MESSAGE
#include <YSI_Data\y_iterate>
#include <YSI_Coding\y_timers>
#undef MAX_PLAYERS
#define MAX_PLAYERS 235
#define STREAMER_OBJECT_SD 700.0
#define STREAMER_OBJECT_DD 300.0
#pragma warning disable 239
//ItemSystem
#include <item>
//
//#include <progress2>
#include <colandreas>
#define TRYG3D_ENABLE_COLANDREAS
#include <3DTryg>
#include <a_mysql>
#include <streamer>
#include <mSelection>
#include <winteredition>

#include "core/server/config.pwn"
//#include "core/server/anticheat.pwn"

new MySQL:sqlHandle;

#pragma dynamic 13623824
main()
{
	print("\nRosalife | Reloaded");
	print("Copyright (c) 2014 by GangstaSunny & Tobi_DeKey - Alle Rechte vorbehalten.\n");
	print("Copyright (c) 2020 by ShadowKev1999 & Reborn - Alle Rechte vorbehalten.\n");
	print("Copyright (c) 2023 by ShadowKev1999 & c0kkie - Alle Rechte vorbehalten.\n");
	print("Copyright (c) 2025 by ShadowKev1999 - Alle Rechte vorbehalten.\n");
}

//HELPERS & UTIL FUNCTIONS

#include "core/utils/arrays.pwn"
#include "core/utils/colors.pwn"
#include "core/utils/functions.pwn"
#include "core/utils/macros.pwn"

//PENDING VARS & FORWARDS

#include "pending/vars.pwn"
#include "pending/forwards.pwn"

//VARIABLES
#include "vars/ui/dialogs.pwn"
#include "vars/ui/playerMenu.pwn"
#include "vars/ui/attachments.pwn"
#include "vars/ui/moneyDraw.pwn"

#include "vars/server/zones.pwn"
#include "vars/server/sounds.pwn"
#include "vars/server/enterexit.pwn"
#include "vars/server/serverTimeline.pwn"
#include "vars/server/pickups.pwn"
#include "vars/server/serverEconomy.pwn"

#include "vars/item/index.pwn"

#include "vars/admin/admin.pwn"
#include "vars/admin/coupons.pwn"
#include "vars/admin/server_restart.pwn"

#include "vars/events/eventboxes.pwn"
#include "vars/events/halloween.pwn"
#include "vars/events/race.pwn"

#include "vars/npcs/actors.pwn"
#include "vars/npcs/bots.pwn"

#include "vars/player/player.pwn"
#include "vars/player/experience.pwn"
#include "vars/player/player_location.pwn"
#include "vars/player/player_title.pwn"

#include "vars/faction/factions.pwn"
#include "vars/faction/drugs.pwn"
#include "vars/faction/government.pwn"
#include "vars/faction/newskiosk.pwn"
#include "vars/faction/spraytags.pwn"
#include "vars/faction/gangzones.pwn"
#include "vars/faction/advertisement.pwn"
#include "vars/faction/newspaper.pwn"
#include "vars/faction/bomb.pwn"
#include "vars/faction/lotto.pwn"

#include "vars/robbery/bankrob.pwn"
#include "vars/robbery/evidence.pwn"

#include "vars/general/server.pwn"
#include "vars/general/groups.pwn"
#include "vars/general/garages.pwn"
#include "vars/general/houses.pwn"
#include "vars/general/stores.pwn"
#include "vars/general/ammunations.pwn"
#include "vars/general/fuelstations.pwn"
#include "vars/general/nodm_zone.pwn"
#include "vars/general/fastfood.pwn"
#include "vars/general/fastfood_stood.pwn"
#include "vars/general/phonesystem/phone_towers.pwn"
#include "vars/general/phonesystem/mobile_phone.pwn"
#include "vars/general/phonesystem/phone_cell.pwn"
#include "vars/general/airdrop.pwn"
#include "vars/general/beachbar.pwn"
#include "vars/general/insurance.pwn"
#include "vars/general/furniture.pwn"

#include "vars/jobs/job.pwn"
#include "vars/jobs/trashmaster.pwn"
#include "vars/jobs/busdriver.pwn"
#include "vars/jobs/harvesting.pwn"
#include "vars/jobs/atms.pwn"
#include "vars/jobs/orange.pwn"
#include "vars/jobs/fisherjob.pwn"
#include "vars/jobs/job_skills.pwn"
//#include "vars/jobs/mining.pwn"
//#include "vars/jobs/lumberjack.pwn"
#include "vars/general/parties.pwn"

#include "vars/vehicles/vehicles.pwn"
#include "vars/vehicles/carinfos.pwn"
#include "vars/vehicles/tuning.pwn"
//#include "vars/vehicles/indicator.pwn"

//MAIN CORE

#include "core/ui/HelpDialog.pwn"
#include "core/ui/playerMenu.pwn"
#include "core/ui/moneyDraw.pwn"

#include "core/server/enterexit.pwn"
#include "core/server/OnRconLoginAttempt.pwn"
#include "core/server/serverTimeline.pwn"
#include "core/server/pickups.pwn"
#include "core/server/serverEconomy.pwn"

#include "core/item/index.pwn"

#include "core/admin/admin.pwn"
#include "core/admin/object_creator.pwn"
#include "core/admin/coupons.pwn"
#include "core/admin/server_restart.pwn"

#include "core/events/eventboxes.pwn"
#include "core/events/easter.pwn"
#include "core/events/halloween.pwn"
#include "core/events/race.pwn"

#include "core/radio/radio.pwn"

#include "core/player/player.pwn"
#include "core/player/experience.pwn"
#include "core/player/weapons.pwn"
#include "core/player/chat.pwn"
#include "core/player/achievement.pwn"
#include "core/player/vip.pwn"
#include "core/player/tutorial.pwn"
#include "core/player/mobilephone.pwn"
#include "core/player/player_location.pwn"
#include "core/player/player_title.pwn"
#include "core/player/email.pwn"
#include "core/player/player_login_protocol.pwn"

#include "core/npcs/actors.pwn"
#include "core/npcs/bots.pwn"

#include "core/general/ammunations.pwn"
#include "core/general/fuelstations.pwn"
#include "core/general/garages.pwn"
#include "core/general/groups.pwn"
#include "core/general/houses.pwn"
#include "core/general/stores.pwn"
#include "core/general/streetsigns.pwn"
#include "core/general/weather.pwn"
#include "core/general/nodm_zone.pwn"
#include "core/general/dice.pwn"
#include "core/general/support.pwn"
#include "core/general/drivingschool.pwn"
#include "core/general/fastfood_stood.pwn"
#include "core/general/phonesystem/phone_towers.pwn"
#include "core/general/phonesystem/mobile_phone.pwn"
#include "core/general/phonesystem/phone_cell.pwn"
#include "core/general/airdrop.pwn"
#include "core/general/beachbar.pwn"
#include "core/general/insurance.pwn"
#include "core/general/toll.pwn"
#include "core/general/furniture.pwn"
#include "core/general/parties.pwn"

#include "core/jobs/job.pwn"
#include "core/jobs/air_trafficking.pwn"
#include "core/jobs/trashcans.pwn"
#include "core/jobs/fishing.pwn"
#include "core/jobs/harvesting.pwn"
#include "core/jobs/pizzaboy.pwn"
#include "core/jobs/orange.pwn"
#include "core/jobs/busdriver.pwn"
#include "core/jobs/atms.pwn"
#include "core/jobs/windowcleaner.pwn"
#include "core/jobs/banksupplier.pwn"
#include "core/jobs/electrician.pwn"
#include "core/jobs/fisherjob.pwn"
#include "core/jobs/job_skills.pwn"
//#include "core/jobs/mining.pwn"
#include "core/jobs/trashmaster.pwn"
//#include "core/jobs/lumberjack.pwn"

#include "core/casino/boxing.pwn"
#include "core/casino/slot_machines.pwn"
#include "core/casino/blackjack.pwn"
//#include "core/casino/poker.pwn"
#include "core/casino/roulette.pwn"
#include "core/casino/casino.pwn"

#include "core/faction/faction.pwn"
#include "core/faction/police.pwn"
#include "core/faction/government.pwn"
#include "core/faction/gangzones.pwn"
#include "core/faction/spraytags.pwn"
#include "core/faction/stopstick.pwn"
#include "core/faction/drugs.pwn"
#include "core/faction/newskiosk.pwn"
#include "core/faction/roadblock.pwn"
#include "core/faction/speedcamera.pwn"
#include "core/faction/advertisement.pwn"
#include "core/faction/newsreporter.pwn"
#include "core/faction/lotto.pwn"

#include "core/vehicles/functions.pwn"
#include "core/vehicles/vehicles.pwn"
#include "core/vehicles/tuning.pwn"
#include "core/vehicles/carinfos.pwn"
//#include "core/vehicles/indicator.pwn"

#include "core/robbery/dynamic_robs.pwn"
#include "core/robbery/blackmarket.pwn"
#include "core/robbery/evidence.pwn"
#include "core/robbery/bankrob.pwn"

#include "core/mysql/bcrypt/OnPasswordChecked.pwn"
#include "core/mysql/bcrypt/OnPasswordHashed.pwn"

#include "core/mysql/functions/mysql_CreateTables.pwn"
#include "core/mysql/functions/mysql_Delete.pwn"
#include "core/mysql/functions/mysql_GetFloat.pwn"
#include "core/mysql/functions/mysql_GetInt.pwn"
#include "core/mysql/functions/mysql_GetIntEx.pwn"
#include "core/mysql/functions/mysql_GetString.pwn"
#include "core/mysql/functions/mysql_SetFloat.pwn"
#include "core/mysql/functions/mysql_SetInt.pwn"
#include "core/mysql/functions/mysql_SetString.pwn"
#include "core/mysql/functions/mysql_ReturnBetaKey.pwn"
#include "core/mysql/functions/mysql_CheckBeta.pwn"

#include "core/mysql/callbacks/onCheckPlayerAccount.pwn"
#include "core/mysql/callbacks/onCheckPlayerBanned.pwn"
#include "core/mysql/callbacks/onCheckPlayerTimebanned.pwn"
#include "core/mysql/callbacks/onCheckPlayerVip.pwn"
#include "core/mysql/callbacks/onCheckPlayerPassword.pwn"
#include "core/mysql/callbacks/OnQueryError.pwn"
#include "core/mysql/callbacks/onVehicleRegistered.pwn"
#include "core/mysql/callbacks/onLoadAccount.pwn"
#include "core/mysql/callbacks/onCheckPlayerVIPStatus.pwn"
#include "core/mysql/callbacks/onCheckGroupNumberplate.pwn"
#include "core/mysql/callbacks/onCheckGroupName.pwn"
#include "core/mysql/callbacks/onAccountExistsForOffBan.pwn"
#include "core/mysql/callbacks/onAccountOnlineForOffBan.pwn"
#include "core/mysql/callbacks/onLoadPlayerWeapons.pwn"
#include "core/mysql/callbacks/onLoadStrassenSchilder.pwn"
#include "core/mysql/callbacks/onUnbanPlayer.pwn"

//COMMANDS
#include "cmds/item/index.pwn"

#include "cmds/server/enterexit.pwn"
#include "cmds/server/pickups.pwn"
#include "cmds/server/serverEconomy.pwn"

#include "cmds/admin/general.pwn"
#include "cmds/admin/supporter.pwn"
#include "cmds/admin/moderator.pwn"
#include "cmds/admin/admin.pwn"
#include "cmds/admin/manager.pwn"
#include "cmds/admin/owner.pwn"
#include "cmds/admin/faction_manager.pwn"
#include "cmds/admin/coupons.pwn"
#include "cmds/admin/server_restart.pwn"

#include "cmds/events/race.pwn"

#include "cmds/player/general.pwn"
#include "cmds/player/mobilephone.pwn"
#include "cmds/player/animations.pwn"
#include "cmds/player/achievement.pwn"
#include "cmds/player/vip.pwn"
#include "cmds/player/chat.pwn"
#include "cmds/player/player_title.pwn"
#include "cmds/player/email.pwn"

#include "cmds/npcs/actors.pwn"

#include "cmds/faction/faction.pwn"
#include "cmds/faction/gangzones.pwn"
#include "cmds/faction/government.pwn"
#include "cmds/faction/newsreporter.pwn"
#include "cmds/faction/paramedic.pwn"
#include "cmds/faction/police.pwn"
#include "cmds/faction/hitman.pwn"
#include "cmds/faction/advertisement.pwn"
#include "cmds/faction/bomb.pwn"
#include "cmds/faction/roadblock.pwn"
#include "cmds/faction/orderdepartment.pwn"
#include "cmds/faction/drugs.pwn"
#include "cmds/faction/toll.pwn"
#include "cmds/faction/speedcamera.pwn"
#include "cmds/faction/departments.pwn"

#include "cmds/jobs/job.pwn"
#include "cmds/jobs/fishing.pwn"
#include "cmds/jobs/orange.pwn"
#include "cmds/jobs/harvesting.pwn"
#include "cmds/jobs/electrician.pwn"
#include "cmds/jobs/pizzaboy.pwn"
#include "cmds/jobs/traindriver.pwn"
#include "cmds/jobs/trucker.pwn"
#include "cmds/jobs/fisherjob.pwn"
#include "cmds/jobs/job_skills.pwn"
//#include "cmds/jobs/mining.pwn"
//#include "cmds/jobs/lumberjack.pwn"
#include "cmds/jobs/atms.pwn"

#include "cmds/general/support.pwn"
#include "cmds/general/groups.pwn"
#include "cmds/general/garages.pwn"
#include "cmds/general/houses.pwn"
#include "cmds/general/stores.pwn"
#include "cmds/general/fuelstations.pwn"
#include "cmds/general/ammunations.pwn"
#include "cmds/general/streetsigns.pwn"
#include "cmds/general/paintball.pwn"
#include "cmds/general/dice.pwn"
#include "cmds/general/fastfood_stood.pwn"
#include "cmds/general/phonesystem/phone_towers.pwn"
#include "cmds/general/phonesystem/mobile_phone.pwn"
#include "cmds/general/phonesystem/phone_cell.pwn"
#include "cmds/general/airdrop.pwn"
#include "cmds/general/beachbar.pwn"
#include "cmds/general/insurance.pwn"
#include "cmds/general/furniture.pwn"
#include "cmds/general/parties.pwn"

#include "cmds/robbery/evidence.pwn"

#include "cmds/vehicles/vehicles.pwn"
#include "cmds/vehicles/tuning.pwn"

#include "mappings/vars.pwn"
#include "mappings/functions.pwn"
#include "mappings/_mappings.pwn"

//PENDING CORE
#include "pending/gamemode.pwn"