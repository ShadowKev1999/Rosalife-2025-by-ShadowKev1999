stock mysql_GetIntEx(const query[])
{
	new Get[128];
	new Cache:Result = mysql_query(sqlHandle, query);
	cache_get_value_index(0, 0, Get);
	cache_delete(Result);
	return strval(Get);
}