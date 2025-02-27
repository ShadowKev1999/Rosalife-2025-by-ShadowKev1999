#define AIRDROP_TIMER (60000 * 30) //alle 45 Minuten

enum E_AIDROP_DATA {
    airObject,
    Text3D:airLabel,
    Float:rayX,
	Float:rayY,
	Float:rayZ,
	Float:rayRX,
	Float:rayRY,
	Float:rayRZ,
    bool:airActive
};
new AirdropData[E_AIDROP_DATA];