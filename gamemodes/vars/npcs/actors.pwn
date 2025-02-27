new PDActorLinks, PDActorRechts, ZiviSpawnLinks, ZiviSpawnRechts, KrankenHausLinks, KrankenHausRechts, PizzaBoteLinks, PizzaBoteRechts, LSPDInnen, GovGruppe, Matsdealer, LSPDWKammer;
new PD2ActorLinks, PD2ActorRechts;

#define MAX_SERVER_ACTORS (150)

enum E_SERVER_ACTORS {
    actorDatabase,
    actorSkinId,
    actorName[MAX_PLAYER_NAME],
    Float:actorPos[4],
    actorAnimation,
    actorId,
    Text3D:actorLabel,
}
new ServerActors[MAX_SERVER_ACTORS][E_SERVER_ACTORS],
    Iterator:IterServerActors<MAX_SERVER_ACTORS>;