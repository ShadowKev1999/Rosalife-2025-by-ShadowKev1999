stock mysql_SetFloat(Table[], const Field[], Float:To, const Where[], const Where2[])
{
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "UPDATE `%s` SET `%s` = '%f' WHERE `%s` = '%s'", Table, Field, To, Where, Where2);
    mysql_tquery(sqlHandle, query);
    return true;
}