<?php
/**
 * Rosalife-2025 Database Configuration
 * Passen Sie diese Einstellungen an Ihre MySQL-Umgebung an
 */

return [
    // MySQL Verbindungseinstellungen
    'database' => [
        'host' => 'localhost',
        'username' => 'root',
        'password' => '',
        'database' => 'rosalife2025',
        'charset' => 'utf8mb4',
        'collation' => 'utf8mb4_german2_ci'
    ],
    
    // Server-Einstellungen
    'server' => [
        'name' => 'Rosalife-2025',
        'language' => 'German/Deutsch',
        'max_players' => 100,
        'port' => 7777
    ],
    
    // Admin-Account Einstellungen
    'admin' => [
        'username' => 'ShadowKev1999',
        'password' => 'admin123',
        'email' => 'admin@rosalife2025.de',
        'level' => 10,
        'admin_level' => 5
    ],
    
    // Standard-Geldbeträge
    'economy' => [
        'start_money' => 3000,
        'start_bank' => 0,
        'admin_money' => 100000,
        'admin_bank' => 500000
    ],
    
    // Debug-Modus
    'debug' => true,
    
    // Logging
    'logging' => [
        'enabled' => true,
        'file' => 'database_setup.log'
    ]
];

?>
