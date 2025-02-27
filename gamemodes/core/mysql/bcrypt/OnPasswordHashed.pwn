forward OnPasswordHashed(playerid);
public OnPasswordHashed(playerid)
{
	new dest[BCRYPT_HASH_LENGTH];
 	bcrypt_get_hash(dest);
	CreateAccount(playerid, dest);
	return 1;
}