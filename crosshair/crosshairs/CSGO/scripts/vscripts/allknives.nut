SendToConsole( @"play buttons/button24");
v_butterfly		<- false;
v_falchion		<- false;
v_flip 			<- false;
v_gut 			<- false;
v_huntsman 		<- false;
v_karambit 		<- false;
v_m9 			<- false;
v_bayonet 		<- false;
v_daggers 		<- false;
v_bowie 		<- false;
v_tknife 		<- false;
v_ctknife 		<- false;
v_blast 		<- false;
v_c4 		<- false;
v_bizon 		<- false;
v_m4a1s 		<- false;
v_chicken 		<- false;
v_baloon 		<- false;
v_boom 		<- false;
v_ghost 		<- false;


function start()
{
	SendToConsole( @"play buttons/button24");
	SendToConsole( @"alias m9bayonet script m9()");
	SendToConsole( @"alias flip script flip()");
	SendToConsole( @"alias bayonet script bayonet()");
	SendToConsole( @"alias butterfly script butterfly()");
	SendToConsole( @"alias falchion script falchion()");
	SendToConsole( @"alias gut script gut()");
	SendToConsole( @"alias hunsman script huntsman()");
	SendToConsole( @"alias karambit script karambit()");
	SendToConsole( @"alias daggers script daggers()");
	SendToConsole( @"alias bowie script bowie()");
	SendToConsole( @"alias knives_reset script knifeReset()");
	SendToConsole( @"alias ctknife script ctknife()");
	SendToConsole( @"alias tknife script tknife()");
	SendToConsole( @"alias blast script blast()");
	SendToConsole( @"alias bizon script bizon()");
	SendToConsole( @"alias chicken script chicken()");
	SendToConsole( @"alias m4a1s script m4a1s()");
	SendToConsole( @"alias c4 script c4()");
	SendToConsole( @"alias baloon script baloon()");
	SendToConsole( @"alias boom script boom()");
	SendToConsole( @"alias ghost script ghost()");

	if (!Entities.FindByName(null, "knifeTimer"))
	{
		local v_knifeTimer = null;
		v_knifeTimer = Entities.CreateByClassname("logic_timer");
		EntFireByHandle(v_knifeTimer, "addoutput", "targetname knifeTimer", 0.0, null, null);
	}
	
	EntFire("knifeTimer", "addoutput", "refiretime 0.05");
	EntFire("knifeTimer", "disable");
	EntFire("knifeTimer", "addoutput", "startdisabled 1");
	EntFire("knifeTimer", "addoutput", "UseRandomTime 0"1);
	EntFire("knifeTimer", "addoutput", "ontimer knifeTimer,RunScriptCode,knifeSet()");
}

function knifeDebug()
{
	printl( @"v_butterfly	= " + v_butterfly);
	printl( @"v_falchion	= " + v_falchion);
	printl( @"v_flip	= " + v_flip);
	printl( @"v_gut	= " + v_gut);
	printl( @"v_huntsman	= " + v_huntsman);
	printl( @"v_karambit	= " + v_karambit);
	printl( @"v_m9	= " + v_m9);
	printl( @"v_bayonet	= " + v_bayonet);
	printl( @"v_daggers	= " + v_daggers);
	printl( @"v_bowie	= " + v_bowie);
	printl( @"v_tknife	= " + v_tknife);
	printl( @"v_ctknife	= " + v_ctknife);
	printl( @"v_blast	= " + v_blast);
	printl( @"v_c4	= " + v_c4);
	printl( @"v_chicken	= " + v_chicken);
	printl( @"v_bizon	= " + v_bizon);
	printl( @"v_m4a1s	= " + v_m4a1s);	
	printl( @"v_baloon	= " + v_baloon);
	printl( @"v_boom	= " + v_boom);
}
function ghost()
{

	v_chicken = false;
	v_baloon = false;
	v_boom = false;

	v_ghost = true;
	
	EntFire("knifeTimer", "enable");
	
}
function baloon()
{

	v_chicken = false;
	v_boom = false;
	v_ghost = false;
	
	v_baloon = true;
	
	EntFire("knifeTimer", "enable");
	
}
function boom()
{

	v_chicken = false;
	v_baloon = false;

	v_boom = true;
	
	EntFire("knifeTimer", "enable");
	
}
function m9()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_karambit = false;
	v_bayonet = false;
	v_daggers = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_m9 = true;
	
	EntFire("knifeTimer", "enable");
	
}

function flip()
{
	v_butterfly	= false;
	v_falchion = false;
	v_gut = false;
	v_huntsman = false;
	v_karambit = false;
	v_m9 = false;
	v_bayonet = false;
	v_daggers = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_flip = true;
	
	EntFire("knifeTimer", "enable");
	
}

function bayonet()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_karambit = false;
	v_m9 = false;
	v_daggers = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_bayonet = true;
	
	EntFire("knifeTimer", "enable");
	
}

function butterfly()
{
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_karambit = false;
	v_m9 = false;
	v_bayonet = false;
	v_daggers = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_butterfly = true;
	
	EntFire("knifeTimer", "enable");
	
}

function falchion()
{
	v_butterfly	= false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_karambit = false;
	v_m9 = false;
	v_bayonet = false;
	v_daggers = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_falchion = true;
	
	EntFire("knifeTimer", "enable");
	
}

function gut()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_huntsman = false;
	v_karambit = false;
	v_m9 = false;
	v_bayonet = false;
	v_daggers = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_gut = true;
	
	EntFire("knifeTimer", "enable");
	
}

function huntsman()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_karambit = false;
	v_m9 = false;
	v_bayonet = false;
	v_daggers = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_huntsman = true;
	
	EntFire("knifeTimer", "enable");
	
}

function karambit()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_m9 = false;
	v_bayonet = false;
	v_daggers = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_karambit = true;
	
	EntFire("knifeTimer", "enable");
	
}

function daggers()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_m9 = false;
	v_bayonet = false;
	v_karambit = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_daggers = true;
	
	EntFire("knifeTimer", "enable");
	
}

function bowie()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_m9 = false;
	v_bayonet = false;
	v_daggers = false;
	v_karambit = false;
	v_tknife = false;
	v_ctknife = false;

	
	v_bowie = true;
	
	EntFire("knifeTimer", "enable");
	
}

function knifeReset()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_m9 = false;
	v_bayonet = false;
	v_daggers = false;
	v_karambit = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;
	v_blast 		<- false;
	v_c4 		<- false;
	v_bizon 		<- false;
	v_m4a1s 		<- false;
	v_chicken 		<- false;
	v_baloon 		<- false;
	v_boom 		<- false;
	v_ghost 		<- false;

	
	EntFire("knifeTimer", "disable");
	
}
function ctknife()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_karambit = false;
	v_bayonet = false;
	v_daggers = false;
	v_bowie = false;
	v_tknife = false;
	v_m9 = false;

	
	v_ctknife = true;
	
	EntFire("knifeTimer", "enable");
	
}
function blast()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_m9 = false;
	v_bayonet = false;
	v_daggers = false;
	v_karambit = false;
	v_bowie = false;
	v_tknife = false;
	v_ctknife = false;


	v_blast = true;
	
	EntFire("knifeTimer", "enable");
	
}
function tknife()
{
	v_butterfly	= false;
	v_falchion = false;
	v_flip = false;
	v_gut = false;
	v_huntsman = false;
	v_karambit = false;
	v_bayonet = false;
	v_daggers = false;
	v_bowie = false;
	v_ctknife = false;
	v_m9 = false;


	v_tknife = true;

	EntFire("knifeTimer", "enable");
	
}
function c4()
{


	v_c4 = true;

	EntFire("knifeTimer", "enable");
	
}
function chicken()
{
	v_boom	= false;
	v_baloon	= false;

	v_chicken = true;

	EntFire("knifeTimer", "enable");
	
}
function bizon()
{

	v_bizon = true;

	EntFire("knifeTimer", "enable");
	
}
function m4a1s()
{

	v_m4a1s = true;

	EntFire("knifeTimer", "enable");
	
}

function knifeSet()
{
		if(v_bayonet) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_bayonet.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_bayonet.mdl");
			}
		}
		else if (v_m9) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_m9_bay.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_m9_bay.mdl");
			}
		}
		else if (v_karambit) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_karam.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_karam.mdl");
			}
		}
		else if (v_huntsman) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_tactical.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_tactical.mdl");
			}
		}
		else if (v_gut) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_gut.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_gut.mdl");
			}
		}
		else if (v_flip) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_flip.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_flip.mdl");
			}
		}
		else if (v_falchion) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_falchion_advanced.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_falchion_advanced.mdl");
			}
		}
		else if (v_butterfly) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_butterfly.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_butterfly.mdl");
			}
		}
		else if (v_daggers) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_push.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_push.mdl");
			}
		}
		else if (v_bowie) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_survival_bowie.mdl");
			}
			
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_survival_bowie.mdl");
			}
		}
		if(v_tknife) 
		{	
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_ct.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_default_t.mdl");
			}
		}
		if(v_ctknife) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_knife_default_t.mdl"))
			{	
				knife.SetModel("models/weapons/v_knife_default_ct.mdl");
			}
			
		}
		if(v_blast) 
		{
			local knife = null;
			while(knife = Entities.FindByModel(knife, "models/weapons/v_eq_taser.mdl"))
			{
			knife.SetModel("models/weapons/v_pist_cz_75.mdl");
			}
		
		}
		if(v_c4) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_eq_fraggrenade.mdl"))
			{	
				knife.SetModel("models/weapons/v_ied.mdl");
			}
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/w_eq_fraggrenade.mdl"))
			{	
				knife.SetModel("models/weapons/w_ied.mdl");
			}
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/w_eq_fraggrenade_dropped.mdl"))
			{	
				knife.SetModel("models/weapons/w_ied_dropped.mdl");
			}
		}
		if(v_chicken) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/chicken/chicken.mdl"))
			{	
				knife.SetModel("models/chicken/chicken_zombie.mdl");
			}
			
		}
		if(v_bizon) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_rif_sg556.mdl"))
			{	
				knife.SetModel("models/weapons/v_smg_bizon.mdl");
			}
			
		}
		if(v_m4a1s) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/weapons/v_rif_m4a1_s.mdl"))
			{	
				knife.SetModel("models/weapons/v_pist_223.mdl");
			}
			
		}
		if(v_baloon) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/chicken/chicken.mdl"))
			{	
				knife.SetModel("models/props/de_overpass/balloon.mdl");
			}
			
		}
		if(v_boom) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/chicken/chicken.mdl"))
			{	
				knife.SetModel("models/chicken/chicken_gone.mdl");
			}
			
		}
		if(v_ghost) 
		{
			local knife = null;
			while (knife = Entities.FindByModel(knife, "models/chicken/chicken.mdl"))
			{	
				knife.SetModel("models/ghost/ghost.mdl");
			}
			
		}
}