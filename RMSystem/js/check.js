function checkform1()
	{
	var flag = document.getElementsByName('typeID')[0].value;
	if(flag=="")
		{
		document.getElementById('ms1').style.display="block";
		}else{
			document.getElementById('ms1').style.display="none";
		}
	}
function checkform2(){
	var flag = document.getElementsByName('typeName')[0].value;
	if(flag=="")
		{
		document.getElementById('ms2').style.display="block";
		}else{
			document.getElementById('ms2').style.display="none";
		}
}
function checkform3(){
	var flag = document.getElementsByName('typeDesc')[0].value;
	if(flag=="")
		{
		document.getElementById('ms3').style.display="block";
		}else{
			document.getElementById('ms3').style.display="none";
		}
}
function checkform4(){
	var flag = document.getElementsByName('typeID')[1].value;
	if(flag=="")
		{
		document.getElementById('ms4').style.display="block";
		}else{
			document.getElementById('ms4').style.display="none";
		}
}
function checkform5(){
	var flag = document.getElementsByName('typeID')[2].value;
	if(flag=="")
		{
		document.getElementById('ms5').style.display="block";
		}else{
			document.getElementById('ms5').style.display="none";
		}
}
function checkform6(){
	var flag = document.getElementsByName('typeID')[3].value;
	if(flag=="")
		{
		document.getElementById('ms6').style.display="block";
		}else{
			document.getElementById('ms6').style.display="none";
		}
}