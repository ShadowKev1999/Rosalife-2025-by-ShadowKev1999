stock mysql_GetInt(const Table[], const Field[], const Where[], const Is[])
{
	new query[128], Get;
	mysql_format(sqlHandle, query, sizeof(query), "SELECT %s FROM %s WHERE %s = '%s'", Field, Table, Where, Is);
	new Cache:Result = mysql_query(sqlHandle, query);
	cache_get_value_name_int(0, Field, Get);
	cache_delete(Result);
	return Get;
}