#include <a_npc>
#define RECORDING "Ziviwinkler"

public OnRecordingPlaybackEnd()
{
	StartRecordingPlayback(2, RECORDING);
}

public OnNPCExitVehicle()
{
	StartRecordingPlayback(2, RECORDING);
}

public OnNPCSpawn()
{
	StartRecordingPlayback(2, RECORDING);
}
