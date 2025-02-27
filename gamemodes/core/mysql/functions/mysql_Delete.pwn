stock mysql_Delete(const Table[], const Where[], const Is[])
{
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `%s` WHERE `%s` = '%s'", Table, Where, Is);
	mysql_tquery(sqlHandle, query);
	return 1;
}