// jQuery
var _hash = window.location.hash;
jQuery(_hash).show();

onload


var NBAPP = 0;
var NBFLOOR = 0;
var NBBASEMENT = 0;
var NBDISTINCTT = 0;
var NBDISTINCTB = 0;
var NBPARKING = 0;
var MAXPERFLOOR = 0;
var NBTRADES = 0;
var NBCAGES = 0;
var HRACTIVITY = 0;
var ID = 0;
var BUILDINGTYPE = "Residential";
var Qual = "Standard";
var TOTESTIMATE = 0;



// NAME AND PHONE NUMBER ------------------------------------------------------

//Elements to put events on (the 2 cells)
var Name = document.getElementById("full_name").value;
var PhoneNumber = document.getElementById("phone_number").value;

// Step 2: Define the event listener function
function NameAndPhone() {
	Name = document.getElementById("full_name").value
	PhoneNumber = document.getElementById("phone_number").value
	console.log(Name, PhoneNumber)
}

function Qual1() {
	Qual = "Standard"
	console.log(Qual)
}

function Qual2() {
	Qual = "Premium"
	console.log(Qual)
}

function Qual3() {
	Qual = "Excelium"
	console.log(Qual)
}

// Attach event listener to element
full_name.addEventListener("keyup", NameAndPhone);
phone_number.addEventListener("keyup", NameAndPhone);


// NAME AND PHONE NUMBER ------------------------------------------------------



// CELLS PART ------------------------------------------------------------------
// Hiding all department

$("#solo_estimate_fake").hide()
$("#inst_fee_fake").hide()
$("#num_elev_fake").hide()
$("#tot_estimate_fake").hide()



function hiding() {
	$("#department_1").hide()
	$("#department_2").hide()
	$("#department_3").hide()
	$("#department_4").hide()
}
hiding();

var building_1 = document.getElementById("building_type").value;


// Step 1: Find the element we want the event on

var choice = document.getElementById("building_type")


// Step 2: Define the event listener function
var department = function () {
	var building_1 = document.getElementById("building_type").value

	if (building_1 === "Residential") {
		$("#department_1").show(500);
		$("#department_2").hide();
		$("#department_3").hide();
		$("#department_4").hide();
		residential_funct();
		quality1_check.addEventListener("click", residential_funct);
		quality2_check.addEventListener("click", residential_funct);
		quality3_check.addEventListener("click", residential_funct);
		quality1_check.addEventListener("click", Qual1);
		quality2_check.addEventListener("click", Qual2);
		quality3_check.addEventListener("click", Qual3);
		NBAPP = nb_app1;
		NBFLOOR = nb_floor1;
		NBBASEMENT = nb_basement1;
		NBDISTINCT = 0;
		NBPARKING = 0;
		MAXPERFLOOR = 0;
		NBTRADES = 0;
		NBCAGES = 0;
		HRACTIVITY = 0;
		BUILDINGTYPE = "Residential";

	}

	if (building_1 === "Commercial") {
		$("#department_1").hide();
		$("#department_2").show(500);
		$("#department_3").hide();
		$("#department_4").hide();
		commercial_funct();
		quality1_check.addEventListener("click", commercial_funct);
		quality2_check.addEventListener("click", commercial_funct);
		quality3_check.addEventListener("click", commercial_funct);
		quality1_check.addEventListener("click", Qual1);
		quality2_check.addEventListener("click", Qual2);
		quality3_check.addEventListener("click", Qual3);
		NBAPP = 0;
		NBFLOOR = nb_floor3;
		NBBASEMENT = nb_basement3;
		NBDISTINCTB = nb_trade3;
		NBPARKING = nb_parking3;
		MAXPERFLOOR = 0;
		NBTRADES = 0;
		NBCAGES = nb_cage_deploy3;
		HRACTIVITY = 0;
		BUILDINGTYPE = "Commercial";
	}

	if (building_1 === "Corporate") {
		$("#department_1").hide();
		$("#department_2").hide();
		$("#department_3").show(500);
		$("#department_4").hide();
		corporate_funct();
		quality1_check.addEventListener("click", corporate_funct);
		quality2_check.addEventListener("click", corporate_funct);
		quality3_check.addEventListener("click", corporate_funct);
		quality1_check.addEventListener("click", Qual1);
		quality2_check.addEventListener("click", Qual2);
		quality3_check.addEventListener("click", Qual3);
		NBAPP = 0;
		NBFLOOR = nb_floor2;
		NBBASEMENT = nb_basement2;
		NBDISTINCTB = dist_loca_2;
		NBPARKING = nb_parking2;
		MAXPERFLOOR = nb_maxPeople_2;
		NBTRADES = 0;
		NBCAGES = 0;
		HRACTIVITY = 0;
		BUILDINGTYPE = "Corporate";
	}

	if (building_1 === "Hybrid") {
		$("#department_1").hide();
		$("#department_2").hide();
		$("#department_3").hide();
		$("#department_4").show(500);
		hybrid_funct();
		quality1_check.addEventListener("click", hybrid_funct);
		quality2_check.addEventListener("click", hybrid_funct);
		quality3_check.addEventListener("click", hybrid_funct);
		quality1_check.addEventListener("click", Qual1);
		quality2_check.addEventListener("click", Qual2);
		quality3_check.addEventListener("click", Qual3);
		NBAPP = 0;
		NBFLOOR = nb_floor4;
		NBBASEMENT = nb_basement4;
		NBDISTINCTB = dist_busi_4;
		NBPARKING = nb_parking4;
		MAXPERFLOOR = nb_maxPeople4;
		NBTRADES = 0;
		NBCAGES = 0;
		HRACTIVITY = hr_activity4;
		BUILDINGTYPE = "Hybrid";

	}

	if (building_1 === "Select") {
		$("#department_1").hide(500);
		$("#department_2").hide(500);
		$("#department_3").hide(500);
		$("#department_4").hide(500);
		hybrid_funct();
	}

}



// Step 3: Attach event listener to element	

choice.addEventListener("change", department);




// CELLS PART  (END)-----------------------------------------------------------

// RESIDENTIAL CALCULS --------------------------------------------------------

// Variables for quality prices
var stand = 7565;
var prem = 12345;
var exel = 15400;
var standIns = stand * 1.1;
var premIns = (prem * 1.13);
var exelIns = exel * 1.16;
var standInsCost = stand * 0.1;
var premInsCost = Math.round(prem * 0.13);
var exelInsCost = exel * 0.16;



//Elements to put events on (the 3 cells)
var nb_app1 = document.getElementById("nb-app");
var nb_floor1 = document.getElementById("nb-floor");
var nb_basement1 = document.getElementById("nb-basement");
var quality1_check = document.getElementById("Standard");
var quality2_check = document.getElementById("Premium");
var quality3_check = document.getElementById("Excelium");



// Residential function
var residential_funct = function () {

	nb_app = parseInt(document.getElementById("nb-app").value);
	console.log(nb_app + "numbers of appartments");


	nb_floor = parseInt(document.getElementById("nb-floor").value);
	console.log(nb_floor + "numbers of floors");

	nb_basement = parseInt(document.getElementById("nb-basement").value);
	console.log(nb_basement + "numbers of basements");




	var app_ratio = Math.ceil(nb_app / nb_floor);
	console.log(app_ratio + "Appartments per floor");

	var nb_elevator = Math.ceil(app_ratio / 6);
	console.log(nb_elevator + "Numbers of elevator needed");

	var nb_column = Math.ceil(nb_floor / 20);
	console.log(nb_column + "numbers of column needed");

	var nb_elevator_modified = Math.ceil(nb_elevator * nb_column);
	console.log(nb_elevator_modified + "numbers of elevator modified");



	var Quality_check = document.getElementById("Quality").value



	if ((document.getElementById("Standard").checked) === true) {
		tot_price = (standIns * nb_elevator_modified).toFixed(2);
		if (isNaN(tot_price, nb_elevator_modified)) {
			tot_price = "0";
			nb_elevator_modified = "0";
		}
		document.getElementById("num_elev").innerHTML = nb_elevator_modified;
		document.getElementById("num_elev_fake").value = nb_elevator_modified;
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = stand.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = standInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);

	} else if ((document.getElementById("Premium").checked) === true) {
		tot_price = Math.round((premIns * nb_elevator_modified) * 100 / 100).toFixed(2);
		if (isNaN(tot_price, nb_elevator_modified)) {
			tot_price = "0";
			nb_elevator_modified = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = prem.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = premInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_elevator_modified;
		document.getElementById("num_elev_fake").value = nb_elevator_modified;

	} else if ((document.getElementById("Excelium").checked) === true) {
		tot_price = (exelIns * nb_elevator_modified).toFixed(2);
		if (isNaN(tot_price, nb_elevator_modified)) {
			tot_price = "0";
			nb_elevator_modified = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = exel.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = exelInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_elevator_modified;
		document.getElementById("num_elev_fake").value = nb_elevator_modified;
	}

	document.getElementById("error_txt").style.display = 'none';
	document.getElementById("error2_txt").style.display = 'none';
	document.getElementById("error3_txt").style.display = 'none';

	if (nb_app < 0)
		document.getElementById("error_txt").style.display = '';
	document.getElementById("error_txt").innerHTML = " Numbers of appartments can't be negative";

	if (nb_floor < 0)
		document.getElementById("error2_txt").style.display = '';
	document.getElementById("error2_txt").innerHTML = " Numbers of floors can't be negative";

	if (nb_basement < 0)
		document.getElementById("error3_txt").style.display = '';
	document.getElementById("error3_txt").innerHTML = " Numbers of basements can't be negative";



}


// Attach event listener to element
nb_app1.addEventListener("keyup", residential_funct);
nb_floor1.addEventListener("keyup", residential_funct);
nb_basement1.addEventListener("keyup", residential_funct);


// RESIDENTIAL CALCULS END ----------------------------------------------------

//CORPORATE CALCULS -----------------------------------------------------------


//Elements to put events on (the 5 cells)
var dist_loca_2 = document.getElementById("dist-loca2");
var nb_floor2 = document.getElementById("nb-floor2");
var nb_basement2 = document.getElementById("nb-basement2");
var nb_parking2 = document.getElementById("nb-parking2");
var nb_maxPeople_2 = document.getElementById("nb-maxPeople2");
var quality_check = document.getElementById("Quality");


// Corporate function
var corporate_funct = function () {


	dist_loca_2 = parseInt(document.getElementById("dist-loca2").value);
	console.log(dist_loca_2 + "numbers of distinct Business 2");

	nb_floor_2 = parseInt(document.getElementById("nb-floor2").value);
	console.log(nb_floor_2 + "numbers of floors 2");

	nb_basement_2 = parseInt(document.getElementById("nb-basement2").value);
	console.log(nb_basement_2 + "numbers of bassement 2");

	nb_parking_2 = parseInt(document.getElementById("nb-parking2").value);
	console.log(nb_parking_2 + "numbers of floors 2");

	nb_maxPeople_2 = parseInt(document.getElementById("nb-maxPeople2").value);
	console.log(nb_maxPeople_2 + "numbers of floors 2");


	var tot_people = Math.ceil(nb_maxPeople_2 * (nb_floor_2 + nb_basement_2));
	console.log(tot_people + "Numbers of people 2");

	var nb_elevator = Math.ceil(tot_people / 1000);
	console.log(nb_elevator + " Nb of elevators 2")

	var nb_column = Math.ceil((nb_floor_2 + nb_basement_2) / 20);
	console.log(nb_column + "numbers of column 2")

	var nb_elevator_almost_tot = Math.ceil(nb_elevator / nb_column);
	console.log(nb_column + "Numbers of column 2");

	var nb_elevator_tot = (nb_elevator_almost_tot * nb_column);
	console.log(nb_column + "Numbers of column 2");


	var Quality_check = document.getElementById("Quality").value


	if ((document.getElementById("Standard").checked) === true) {
		tot_price = (standIns * nb_elevator_tot).toFixed(2);
		if (isNaN(tot_price, nb_elevator_tot)) {
			tot_price = "0";
			nb_elevator_tot = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = stand.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = standInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_elevator_tot;
		document.getElementById("num_elev_fake").value = nb_elevator_tot;

	} else if ((document.getElementById("Premium").checked) === true) {
		tot_price = Math.round((premIns * nb_elevator_tot * 100) / 100).toFixed(2);
		if (isNaN(tot_price, nb_elevator_tot)) {
			tot_price = "0";
			nb_elevator_tot = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = prem.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = premInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_elevator_tot;
		document.getElementById("num_elev_fake").value = nb_elevator_tot;

	} else if ((document.getElementById("Excelium").checked) === true) {
		tot_price = (exelIns * nb_elevator_tot).toFixed(2);
		if (isNaN(tot_price, nb_elevator_tot)) {
			tot_price = "0";
			nb_elevator_tot = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = exel.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = exelInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_elevator_tot;
		document.getElementById("num_elev_fake").value = nb_elevator_tot;
	}


	document.getElementById("error4_txt").style.display = 'none';
	document.getElementById("error5_txt").style.display = 'none';
	document.getElementById("error6_txt").style.display = 'none';
	document.getElementById("error7_txt").style.display = 'none';
	document.getElementById("error8_txt").style.display = 'none';

	if (nb_basement_2 < 0)
		document.getElementById("error4_txt").style.display = '';
	document.getElementById("error4_txt").innerHTML = " Numbers of basements can't be negative";

	if (nb_floor_2 < 0)
		document.getElementById("error5_txt").style.display = '';
	document.getElementById("error5_txt").innerHTML = " Numbers of floors can't be negative";

	if (nb_maxPeople_2 < 0)
		document.getElementById("error6_txt").style.display = '';
	document.getElementById("error6_txt").innerHTML = " Numbers of peoples can't be negative";

	if (nb_parking_2 < 0)
		document.getElementById("error7_txt").style.display = '';
	document.getElementById("error7_txt").innerHTML = " Numbers of parkings can't be negative";

	if (dist_loca_2 < 0)
		document.getElementById("error8_txt").style.display = '';
	document.getElementById("error8_txt").innerHTML = " Numbers of distinct business can't be negative";







}


// Attach event listener to element
dist_loca_2.addEventListener("keyup", corporate_funct);
nb_floor2.addEventListener("keyup", corporate_funct);
nb_basement2.addEventListener("keyup", corporate_funct);
nb_parking2.addEventListener("keyup", corporate_funct);
nb_maxPeople_2.addEventListener("keyup", corporate_funct);


// CORPORATE CALCULS END-------------------------------------------------------

// COMMERCIAL CALCULS --------------------------------------------------------

//Elements to put events on (the 5 cells)
var nb_trade3 = document.getElementById("nb-trade3");
var nb_floor3 = document.getElementById("nb-floor3");
var nb_basement3 = document.getElementById("nb-basement3");
var nb_parking3 = document.getElementById("nb-parking3");
var nb_cage_deploy3 = document.getElementById("nb-cage-deploy3");
var quality_check = document.getElementById("Quality");


// Commercial function
var commercial_funct = function () {

	nb_trade3 = document.getElementById("nb-trade3").value;
	nb_floor3 = document.getElementById("nb-floor3").value;
	nb_basement3 = document.getElementById("nb-basement3").value;
	nb_parking3 = document.getElementById("nb-parking3").value;
	nb_cage_deploy3 = document.getElementById("nb-cage-deploy3").value;

	console.log(nb_cage_deploy3 + "numbers of cage deploy 3");

	var Quality_check = document.getElementById("Quality").value



	if ((document.getElementById("Standard").checked) === true) {
		tot_price = (standIns * nb_cage_deploy3).toFixed(2);
		if (isNaN(tot_price, nb_cage_deploy3)) {
			tot_price = "0";
			nb_cage_deploy3 = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = stand.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = standInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_cage_deploy3;
		document.getElementById("num_elev_fake").value = nb_cage_deploy3;
	}
	if ((document.getElementById("Premium").checked) === true) {
		tot_price = Math.round((premIns * nb_cage_deploy3 * 100) / 100).toFixed(2);
		if (isNaN(tot_price, nb_cage_deploy3)) {
			tot_price = "0";
			nb_cage_deploy3 = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = prem.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = premInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_cage_deploy3;
		document.getElementById("num_elev_fake").value = nb_cage_deploy3;
	}
	if ((document.getElementById("Excelium").checked) === true) {
		tot_price = (exelIns * nb_cage_deploy3).toFixed(2);
		if (isNaN(tot_price, nb_cage_deploy3)) {
			tot_price = "0";
			nb_cage_deploy3 = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = exel.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = exelInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_cage_deploy3;
		document.getElementById("num_elev_fake").value = nb_cage_deploy3;
	}

	document.getElementById("error9_txt").style.display = 'none';


	if (nb_cage_deploy3 < 0)
		document.getElementById("error9_txt").style.display = '';
	document.getElementById("error9_txt").innerHTML = " Numbers of elevators cages can't be negative";



	if (nb_basement3 < 0)
		document.getElementById("error4_txt").style.display = '';
	document.getElementById("error4_txt").innerHTML = " Numbers of basements can't be negative";







}


// Attach event listener to element
nb_trade3.addEventListener("keyup", commercial_funct);
nb_floor3.addEventListener("keyup", commercial_funct);
nb_basement3.addEventListener("keyup", commercial_funct);
nb_parking3.addEventListener("keyup", commercial_funct);
nb_cage_deploy3.addEventListener("keyup", commercial_funct);


// COMMERCIAL CALCULS END ---------------------------------------------------

// HYBRID CALCULS ------------------------------------------------------------

//Elements to put events on (the 5 cells)
var dist_busi_4 = document.getElementById("dist-busi4");
var nb_floor4 = document.getElementById("nb-floor4");
var nb_basement4 = document.getElementById("nb-basement4");
var nb_parking4 = document.getElementById("nb-parking4");
var nb_people4 = document.getElementById("nb-people4");
var nb_maxPeople_4 = document.getElementById("nb-people4");
var hr_activity4 = document.getElementById("hr-activity4");
var quality_check = document.getElementById("Quality");


// HYBRID function
var hybrid_funct = function () {

	nb_maxPeople_4 = document.getElementById("nb-people4").value;

	dist_busi_4 = parseInt(document.getElementById("dist-busi4").value);
	console.log(dist_busi_4 + "numbers of distinct Business 4");

	nb_floor_4 = parseInt(document.getElementById("nb-floor4").value);
	console.log(nb_floor_4 + "numbers of floors 4");

	nb_basement_4 = parseInt(document.getElementById("nb-basement4").value);
	console.log(nb_basement_4 + "numbers of bassement 4");

	nb_parking_4 = parseInt(document.getElementById("nb-parking4").value);
	console.log(nb_parking_4 + "numbers of parking 4");

	nb_people_4 = parseInt(document.getElementById("nb-people4").value);
	console.log(nb_people_4 + "numbers of people per floor 4");

	hr_activity_4 = parseInt(document.getElementById("hr-activity4").value);
	console.log(hr_activity_4 + "Hours of activity 4");


	var tot_people = Math.ceil(nb_people_4 * (nb_floor_4 + nb_basement_4));
	console.log(tot_people + "Numbers of people 4");

	var nb_elevator = Math.ceil(tot_people / 1000);
	console.log(nb_elevator + " Nb of elevators 4")

	var nb_column = Math.ceil((nb_floor_4 + nb_basement_4) / 20);
	console.log(nb_column + "numbers of column 4")

	var nb_elevator_almost_tot = Math.ceil(nb_elevator / nb_column);
	console.log(nb_column + "Numbers of column 4");

	var nb_elevator_tot = (nb_elevator_almost_tot * nb_column);
	console.log(nb_column + "Numbers of column 2");


	var Quality_check = document.getElementById("Quality").value


	if ((document.getElementById("Standard").checked) === true) {
		tot_price = (standIns * nb_elevator_tot).toFixed(2);
		if (isNaN(tot_price, nb_elevator_tot)) {
			tot_price = "0";
			nb_elevator_tot = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = stand.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = standInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_elevator_tot;
		document.getElementById("num_elev_fake").value = nb_elevator_tot;
	}
	if ((document.getElementById("Premium").checked) === true) {
		tot_price = Math.round((premIns * nb_elevator_tot * 100) / 100).toFixed(2);
		if (isNaN(tot_price, nb_elevator_tot)) {
			tot_price = "0";
			nb_elevator_tot = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = prem.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = premInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_elevator_tot;
		document.getElementById("num_elev_fake").value = nb_elevator_tot;
	}
	if ((document.getElementById("Excelium").checked) === true) {
		tot_price = (exelIns * nb_elevator_tot).toFixed(2);
		if (isNaN(tot_price, nb_elevator_tot)) {
			tot_price = "0";
			nb_elevator_tot = "0";
		}
		document.getElementById("tot_estimate").innerHTML = tot_price + "$";
		document.getElementById("tot_estimate_fake").value = tot_price;
		document.getElementById("solo_estimate").innerHTML = exel.toFixed(2) + "$";
		document.getElementById("solo_estimate_fake").value = stand.toFixed(2);
		document.getElementById("inst_fee").innerHTML = exelInsCost.toFixed(2) + "$";
		document.getElementById("inst_fee_fake").value = standInsCost.toFixed(2);
		document.getElementById("num_elev").innerHTML = nb_elevator_tot;
		document.getElementById("num_elev_fake").value = nb_elevator_tot;
	}

	document.getElementById("error10_txt").style.display = 'none';
	document.getElementById("error11_txt").style.display = 'none';
	document.getElementById("error12_txt").style.display = 'none';
	document.getElementById("error13_txt").style.display = 'none';
	document.getElementById("error14_txt").style.display = 'none';
	document.getElementById("error15_txt").style.display = 'none';



	if (nb_floor_4 < 0)
		document.getElementById("error10_txt").style.display = '';
	document.getElementById("error10_txt").innerHTML = " Numbers of floors can't be negative";

	if (nb_basement_4 < 0)
		document.getElementById("error11_txt").style.display = '';
	document.getElementById("error11_txt").innerHTML = " Numbers of basements can't be negative";

	if (nb_people_4 < 0)
		document.getElementById("error12_txt").style.display = '';
	document.getElementById("error12_txt").innerHTML = " Numbers of peoples can't be negative";

	if (dist_busi_4 < 0)
		document.getElementById("error14_txt").style.display = '';
	document.getElementById("error14_txt").innerHTML = " Numbers of peoples can't be negative";

	if (nb_parking_4 < 0)
		document.getElementById("error15_txt").style.display = '';
	document.getElementById("error15_txt").innerHTML = " Numbers of peoples can't be negative";


	if (hr_activity_4 > 24)
		document.getElementById("error13_txt").style.display = '';
	document.getElementById("error13_txt").innerHTML = " Invalid value. Need to be between 0 and 24 hour per day";

	if (hr_activity_4 < 0)
		document.getElementById("error13_txt").style.display = '';
	document.getElementById("error13_txt").innerHTML = " Invalid value. Need to be between 0 and 24 hour per day";








}

// Attach event listener to element
dist_busi_4.addEventListener("keyup", hybrid_funct);
nb_floor4.addEventListener("keyup", hybrid_funct);
nb_basement4.addEventListener("keyup", hybrid_funct);
nb_parking4.addEventListener("keyup", hybrid_funct);
nb_people4.addEventListener("keyup", hybrid_funct);
hr_activity4.addEventListener("keyup", hybrid_funct);


//HYBRID CALCULS END --------------------------------------------------------



// var sendingQuote = {
// 	"FullName": Name,
// 	"PhoneNumber": PhoneNumber,
// 	"NbApp": NBAPP,
// 	"NbFloor": NBFLOOR,
// 	"NbBasement": NBBASEMENT,
// 	"NbDistinctB": NBBASEMENT,
// 	"NbParking": NBPARKING,
// 	"MaxPerFloor": MAXPERFLOOR,
// 	"NbTrades": NBTRADES,
// 	"NbCages": NBCAGES,
// 	"HrActivity": HRACTIVITY,
// 	"BuildingType": BUILDINGTYPE,
// 	"Quality": Qual,
// 	"TotEstimate": TOTESTIMATE,
// 	"NbDistinctT": NBDISTINCTT
// }

// // app\controllers\application_controller.rb

// $("#send").click(function () {
// 	if (building_1 === "Residential") {
// 		NBAPP = nb_app1;
// 		NBFLOOR = nb_floor1;
// 		NBBASEMENT = nb_basement1;
// 		NBDISTINCT = 0;
// 		NBPARKING = 0;
// 		MAXPERFLOOR = 0;
// 		NBTRADES = 0;
// 		NBCAGES = 0;
// 		HRACTIVITY = 0;
// 		BUILDINGTYPE = "Residential";
// 	}

// 	if (building_1 === "Commercial") {
// 		NBAPP = 0;
// 		NBFLOOR = nb_floor3;
// 		NBBASEMENT = nb_basement3;
// 		NBDISTINCTB = nb_trade3;
// 		NBPARKING = nb_parking3;
// 		MAXPERFLOOR = 0;
// 		NBTRADES = 0;
// 		NBCAGES = nb_cage_deploy3;
// 		HRACTIVITY = 0;
// 		BUILDINGTYPE = "Commercial";
// 	}

// 	if (building_1 === "Corporate") {
// 		NBAPP = 0;
// 		NBFLOOR = nb_floor2;
// 		NBBASEMENT = nb_basement2;
// 		NBDISTINCTB = dist_loca_2;
// 		NBPARKING = nb_parking2;
// 		MAXPERFLOOR = nb_maxPeople_2;
// 		NBTRADES = 0;
// 		NBCAGES = 0;
// 		HRACTIVITY = 0;
// 		BUILDINGTYPE = "Corporate";
// 	}

// 	if (building_1 === "Hybrid") {
// 		NBAPP = 0;
// 		NBFLOOR = nb_floor4;
// 		NBBASEMENT = nb_basement4;
// 		NBDISTINCTB = dist_busi_4;
// 		NBPARKING = nb_parking4;
// 		MAXPERFLOOR = nb_maxPeople4;
// 		NBTRADES = 0;
// 		NBCAGES = 0;
// 		HRACTIVITY = hr_activity4;
// 		BUILDINGTYPE = "Hybrid";
// 	}
// });

// AllInfo = {
// 	"Fullname": Name,
// 	"Business name": PhoneNumber,
// 	"NbApp": NBAPP,
// 	"NbFloor": NBFLOOR,
// 	"NbBasement": NBBASEMENT,
// 	"NbDistinctB": NBBASEMENT,
// 	"NbParking": NBPARKING,
// 	"MaxPerFloor": MAXPERFLOOR,
// 	"NbTrades": NBTRADES,
// 	"NbCages": NBCAGES,
// 	"HrActivity": HRACTIVITY,
// 	"BuildingType": BUILDINGTYPE,
// 	"Quality": Qual,
// 	"TotEstimate": TOTESTIMATE,
// 	"NbDistinctT": NBDISTINCTT

// }


// $("#send").click(function () {
// 	console.log("WORKING ?!??!?")
// 	$.post("../../controllers/application_controller", {
// 		"Fullname": Name,
// 		"Business name": PhoneNumber,
// 		"NbApp": NBAPP,
// 		"NbFloor": NBFLOOR,
// 		"NbBasement": NBBASEMENT,
// 		"BuildingType": BUILDINGTYPE,
// 		"Quality": Qual,
// 		"TotEstimate": TOTESTIMATE,
// 		"NbDistinctT": NBDISTINCTT
// 	});
// });