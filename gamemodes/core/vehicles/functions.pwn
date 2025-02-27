stock IsAFahrrad(tmpcar)
{
    new modelid = GetVehicleModel(tmpcar);
    if(modelid == 481 || modelid == 509 || modelid == 510) return 1;
    else return 0;
}

stock IsAMotorrad(tmpcar)
{
	new modelid = GetVehicleModel(tmpcar);
	if(modelid == 448 || modelid == 461 || modelid == 462 || modelid == 463 || modelid == 468 || modelid == 471
	|| modelid == 521 || modelid == 522 || modelid == 523 || modelid == 581) return 1;
	else return 0;
}

stock IsABoot(tmpcar)
{
	new modelid = GetVehicleModel(tmpcar);
	if(modelid == 446 || modelid == 452 || modelid == 453 || modelid == 454 || modelid == 472 || modelid == 473
	|| modelid == 484 || modelid == 493 || modelid == 595) return 1;
	else return 0;
}

stock IsAHelikopter(tmpcar)
{
    new modelid = GetVehicleModel(tmpcar);
    if(modelid == 417 || modelid == 425 || modelid == 447 || modelid == 469 || modelid == 487 || modelid == 488 || modelid == 497 || modelid == 548 || modelid == 563) return 1;
    else return 0;
}

stock IsAFlugzeug(tmpcar)
{
	new modelid = GetVehicleModel(tmpcar);
	if(modelid == 417 || modelid == 425 || modelid == 447 || modelid == 460 || modelid == 469 || modelid == 476
	|| modelid == 487 || modelid == 488 || modelid == 497 || modelid == 511 || modelid == 512 || modelid == 513
	|| modelid == 519 || modelid == 520 || modelid == 548 || modelid == 553 || modelid == 563 || modelid == 577
	|| modelid == 592 || modelid == 593) return 1;
	else return 0;
}

stock IsALKW(tmpcar)
{
	new modelid = GetVehicleModel(tmpcar);
	if(modelid == 403 || modelid == 406 || modelid == 407 || modelid == 408 || modelid == 413 || modelid == 414
	|| modelid == 416 || modelid == 427 || modelid == 428 || modelid == 433 || modelid == 435 // ||modelid == 431 (bus)
	|| modelid == 443 || modelid == 450 || modelid == 455 || modelid == 456 || modelid == 486 // || modelid == 437 (coach)
	|| modelid == 498 || modelid == 499 || modelid == 508 || modelid == 514 || modelid == 515 || modelid == 524
	|| modelid == 532 || modelid == 544 || modelid == 554 || modelid == 556 || modelid == 482 // modelid == 552 (elektriker fahrzeug)
	|| modelid == 557 || modelid == 573 || modelid == 578 || modelid == 582 || modelid == 584 || modelid == 588
	|| modelid == 591 || modelid == 601 || modelid == 609 || modelid == 610 || modelid == 611 || modelid == 423
	|| modelid == 440 || modelid == 444 || modelid == 459) return 1;
	else return 0;
}

stock TankArtName(tmpcar)
{
	new status[12];
	switch(VehicleData[GetVehicleModel(tmpcar)-400][vehTankArt])
	{
	    case 0:{status="Benzin";}
	    case 1:{status="Diesel";}
	    case 2:{status="Kerosin";}
	}
	return status;
}

stock RemoveVehicleTuning(tmpcar)
{
    for(new tuningcomp;tuningcomp<13;tuningcomp++)
    {
        new tuning = GetVehicleComponentInSlot(tmpcar, CARMODTYPE:tuningcomp);
        if(tuning >= 1000 || tuning <= 1193)
        {
            RemoveVehicleComponent(tmpcar,tuning);
        }
    }
	return 1;
}

stock DestroyVehicleEx(tmpcar)
{
	printf("Das Fahrzeug mit der ID '%d' wurde gelöscht.",tmpcar);
	RemoveVehicleTuning(tmpcar);
	if(FahrzeugInfo[tmpcar][fSupmobil3DText] != Text3D:INVALID_3DTEXT_ID)
	{
		DestroyDynamic3DTextLabel(FahrzeugInfo[tmpcar][fSupmobil3DText]);
		FahrzeugInfo[tmpcar][fSupmobil3DText] = Text3D:INVALID_3DTEXT_ID;
	}
	if(FahrzeugInfo[tmpcar][fSupMobilObj][0] != INVALID_OBJECT_ID)
	{
		for(new supobjects; supobjects < 4; supobjects++)
		{
		    DestroyDynamicObject(FahrzeugInfo[tmpcar][fSupMobilObj][supobjects]);
		    FahrzeugInfo[tmpcar][fSupMobilObj][supobjects] = INVALID_OBJECT_ID;
		}
	}
	return DestroyVehicle(tmpcar);
}