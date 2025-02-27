public Float:mysql_GetFloat(const Table[], const Field[], const Where[], const Is[])
{
    new query[128], Float:sqlfloat;
    mysql_format(sqlHandle, query, sizeof(query), "SELECT `%s` FROM `%s` WHERE `%s` = '%s'", Field, Table, Where, Is);
    new Cache:Result = mysql_query(sqlHandle, query);
	cache_get_value_name_float(0, Field, sqlfloat);
	cache_delete(Result);
    return sqlfloat;
}