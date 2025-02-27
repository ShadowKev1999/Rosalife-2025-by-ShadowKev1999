addServerTimelineEvent(timelineTagId, userId, const _description[]) {
    new query[256];
    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `server_timeline` (`userId`, `tagId`, `description`) VALUES (%i, %i, '%s')", userId, timelineTagId, _description);
    mysql_tquery(sqlHandle, query);
    return 1;
}