stock mysql_ReturnBetaKey(const Name[])
{
    new query[130], Get[130];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT `Key` FROM `beta` WHERE `Name` = '%s'", Name);
    new Cache:Result = mysql_query(sqlHandle, query);
	cache_get_value_name(0, "Key", Get);
	cache_delete(Result);
    return Get;
}