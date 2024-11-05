var majorDepartment;
var auxiliaryDepartment;
var doubleMajorDepartment;
var check = 0;

//確保 DOM 加載完成
document.addEventListener('DOMContentLoaded', function() {
    majorDepartmentRadio();
    auxiliaryDepartmentRadio();
    doubleMajorDepartmentRadio();
});


function majorDepartmentRadio(){
    const radios = document.getElementsByName("majorDepartmentId");
    radios.forEach(radio => {
        radio.addEventListener('change', function(event){
            console.log("old: ", majorDepartment);
            var text = document.getElementById(event.target.value).textContent;
            majorDepartment = text.substring(0, 3);
            console.log("new: ", majorDepartment);

        });
    });
}

function doubleMajorDepartmentRadio(){
    const radios = document.getElementsByName("doubleMajorDepartmentId");
    radios.forEach(radio => {
        radio.addEventListener('change', function(event){
            console.log("old: ", doubleMajorDepartment);
            if(event.target.value != 0){
                var text = document.getElementById(event.target.value).textContent;
                doubleMajorDepartment = text.substring(0, 3);
            }else{
                doubleMajorDepartment = "doubleMajorDepartment";
            }
            console.log("new: ", doubleMajorDepartment);

        });
    });
}

function auxiliaryDepartmentRadio(){
    const radios = document.getElementsByName("auxiliaryDepartmentId");
    radios.forEach(radio => {
        radio.addEventListener('change', function(event){
            console.log("old: ", auxiliaryDepartment);
            if(event.target.value != 0){
                var text = document.getElementById(event.target.value).textContent;
                auxiliaryDepartment = text.substring(0, 3);
            }
            else{
                auxiliaryDepartment = "auxiliaryDepartment";
            }
            console.log("new: ", auxiliaryDepartment);
        });
    });
}

function versionCheck(){
    if(majorDepartment == auxiliaryDepartment){
        check = 1;
    }
    else if(majorDepartment == doubleMajorDepartment){
        check = 2;
    }
    else if(auxiliaryDepartment == doubleMajorDepartment){
        check = 3;
    }
    else{
        check = 0;
    }
    switch(check){
        case 1:
            alert("主修、輔系不合法");
            return false;
        case 2:
            alert("主修、雙主修不合法");
            return false;
        case 3:
            alert("輔系、雙主修不合法");
            return false;
        default:        
        return true;
    }
}

