function jump_gourl1(){ 
	var jump = document.gourl1;
	var selObj= jump.familysite1.value;
	if(!jump.familysite1.value || jump.familysite1.value == "") {
	alert("사이트를 선택해주세요");
	return false;
	}
	window.open("http://"+selObj);
	jump.familysite1.selectedIndex=0; 
	return false;
}

function jump_gourl2(){ 
	var jump = document.gourl2;
	var selObj= jump.familysite2.value;
	if(!jump.familysite2.value || jump.familysite2.value == "") {
	alert("사이트를 선택해주세요");
	return false;
	}
	window.open("http://"+selObj);
	jump.familysite2.selectedIndex=0; 
	return false;
}

function jump_gourl3(){ 
	var jump = document.gourl3;
	var selObj= jump.familysite3.value;
	if(!jump.familysite3.value || jump.familysite3.value == "") {
	alert("사이트를 선택해주세요");
	return false;
	}
	window.open("http://"+selObj);
	jump.familysite3.selectedIndex=0;
	return false;
}

function jump_gourl4(){ 
	var jump = document.gourl4;
	var selObj= jump.familysite4.value;
	if(!jump.familysite4.value || jump.familysite4.value == "") {
	alert("사이트를 선택해주세요");
	return false;
	}
	window.open("http://"+selObj);
	jump.familysite4.selectedIndex=0; 
	return false;
}
