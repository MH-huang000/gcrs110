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

    
});

// 顯示/隱藏 正在修
function showOnGoing() {
    let infoExtras = document.querySelectorAll('.info-extra');
    infoExtras.forEach(function(infoExtra) {
        infoExtra.classList.toggle('expanded');
        console.log("顯示/隱藏'正在修'")
    });
}