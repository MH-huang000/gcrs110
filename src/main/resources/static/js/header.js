//確保 DOM 加載完成
document.addEventListener('DOMContentLoaded', function() {

    // 顯示/隱藏 正在修
    const checkbox = document.getElementById('is-learning');
    checkbox.addEventListener('change', showOnGoing);
    
    // 版本資訊收合
    const toggleBtn = document.querySelector('.fa-list');
    const setversion = document.querySelector('.setVersion');
    toggleBtn.addEventListener('click', function(){
        setversion.classList.toggle('expanded');
    });

    searchListen();
    switchVersion();
    updateVersion();
    deleteVersion();
    submitVersion();
    
});

// 顯示/隱藏 正在修
function showOnGoing() {
    let infoExtras = document.querySelectorAll('.info-extra');
    infoExtras.forEach(function(infoExtra) {
        infoExtra.classList.toggle('expanded');
        console.log("顯示/隱藏'正在修'")
    });
}

//查詢
function searchListen(){
    const button = document.getElementById("search-button");
    button.addEventListener('click', function(){
        keyword = document.getElementById("search").value;
        console.log(keyword);
        url = "http://localhost:8080/versions/search?keyword=" + keyword;
        fetch(url)
        .then(response =>{
            return response.text();
        }).then(text =>{
            console.log(text);
            document.getElementById('search-result').outerHTML = text;
            rightTableAddListen()
        }).catch(err =>{
            console.log(err)
        });
    })
}

//登出
function logout(){
    console.log("登出");
    if(save){
        fetch("http://localhost:8080/versions/logout", {
            method: 'GET',
            headers:{'Content-Type': 'application/json'},
        }).then(response =>{
            console.log(response);
            return response.text();
        }).then(text =>{
            console.log(text);
            document.location.href = "http://localhost:8080/logout";
        }).catch(err =>{
            console.log(err)
        });
    }
    else{
        if(confirm("尚未保存確定要離開嗎?") == true){
            fetch("http://localhost:8080/versions/logout", {
                method: 'GET',
                headers:{'Content-Type': 'application/json'},
            }).then(response =>{
                console.log(response);
                return response.text();
            }).then(text =>{
                console.log(text);
                document.location.href = "http://localhost:8080/logout";
            }).catch(err =>{
                console.log(err)
            });
        }
    }
}

//切換版本
function switchVersion(){
    var button = document.getElementById("switch-version");
    button.addEventListener("click", function(){
        if(save){
            console.log("切換版本");
            window.location.href = "http://localhost:8080/versions";
        }
        else{
            if(confirm("尚未保存確定要切換版本嗎?") == true){
                console.log("切換版本");
                window.location.href = "http://localhost:8080/versions";
            }
        }
    });
    
}
//更新版本課架
function updateVersion(){
    var button = document.getElementById("update-version");
    button.addEventListener("click", function(){
        console.log("更新版本");
        window.location.href = "http://localhost:8080/versions/update";
        
    });
}
//刪除版本
function deleteVersion(){
    var button = document.getElementById("delete-version");
    button.addEventListener("click", function(){
        console.log("刪除版本");
        if(confirm("確定要刪除?") == true){
            fetch("http://localhost:8080/versions/delete", {
                method:'DELETE',
            })
            .then(response =>{
                console.log(response);
                return response.text();
            }).then(text =>{
                console.log(text);
                window.location.href = "http://localhost:8080/versions";
            }).catch(err =>{
                console.log(err)
            });
        }
    });
}

//提交版本
function submitVersion(){
    var button = document.getElementById("submit-version");
    button.addEventListener("click", function(){
        console.log("提交版本");
        fetch("http://localhost:8080/versions/submit", {
            method:'POST',
        })
        .then(response =>{
            console.log(response);
            return response.text();
        }).then(text =>{
            console.log(text);
        }).catch(err =>{
            console.log(err)
        });
        
    });
}