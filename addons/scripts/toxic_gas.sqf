//	@file Name: teargas.sqf
//	@file Author: Mokey & whoever made the teargas script!
//	@file Description: Toxic Gas addon for A3W
//  @web: http://www.fractured-gaming.com
// ** Special Thanks to Pitoucc
While{true} do{
    "dynamicBlur" ppEffectEnable true;                   // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0];                    // enables normal vision
    "dynamicBlur" ppEffectCommit 10;                     // time it takes to normal
    resetCamShake;                                       // resets the shake
    20 fadeSound 1;                                      // fades the sound back to normal	
	
	waituntil{
		((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10)       // detects if player is within grenade radius
	};

	if  if ((headgear player != "H_CrewHelmetHeli_B") && sleepFucntion) then{
		"dynamicBlur" ppEffectEnable true;               // enables ppeffect
		"dynamicBlur" ppEffectAdjust [15];               // intensity of blur
		"dynamicBlur" ppEffectCommit 5;                  // time till vision is fully blurred
		enableCamShake true;                             // enables camera shake
		addCamShake [10, 45, 10];                        // sets shakevalues
		player setFatigue 0;                             // sets the fatigue to 100%
		5 fadeSound 0.1;                                 // fades the sound to 10% in 5 seconds
			
		while {(alive player) && ((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10) && (headgear player != "H_CrewHelmetHeli_B")} do{
			player setDamage (damage player + 0.12);     //damage per tick
			sleep 5;                                     // Timer damage is assigned "seconds"
		};
	};
	sleep 5;
};

sleepFucntion = {
    sleep 2;
	true; // returns true
};