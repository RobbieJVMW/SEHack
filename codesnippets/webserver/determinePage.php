
switch ($page) {
	
	case "viewReadings":
	viewReading($itype,$ival,$conn);
	break; 
	
	
	default:
	homePage($type,$val,$conn);
	
}