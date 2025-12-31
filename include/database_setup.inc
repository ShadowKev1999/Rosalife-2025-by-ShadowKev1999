/*
 * Rosalife-2025 Database Setup Include
 * Einfache Integration für Datenbank-Setup
 */

#if defined _database_setup_included
    #endinput
#endif
#define _database_setup_included

// Forward declarations
forward Database_Initialize();
forward Database_CheckTables();
forward Database_CreateTables();
forward Database_VerifyTables();
forward Database_CreateAdminAccount();
forward Database_SetupComplete();
forward OnDatabaseSetupComplete();

// Stocks
stock IsDatabaseSetupComplete();
stock TriggerDatabaseSetup();
stock CheckTableExists(table_name[]);

// Admin Commands
CMD:setupdb(playerid, params[]);
CMD:checkdb(playerid, params[]);

// Native für einfache Überprüfung
native IsTableReady(table_name[]);
native GetDatabaseSetupProgress();
