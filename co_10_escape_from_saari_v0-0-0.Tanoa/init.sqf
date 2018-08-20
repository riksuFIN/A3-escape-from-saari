//Init.sqf



debug = true;


// Run Settings.sqf
null = execVM "Settings.sqf";








// Run script to filter StartPos and ObjectivePos markers
null = execVM "Scripts\Prepare\FindStartPos.sqf";



