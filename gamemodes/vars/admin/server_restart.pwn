enum E_GMX_DATA {
    bool:restartActive,
    pendingRestartTime,
    restartTime,
    restartAdmin[MAX_PLAYER_NAME],
    Timer:restartTimer,
}

new GMX_Data[E_GMX_DATA];