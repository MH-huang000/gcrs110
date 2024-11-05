var save = true;
//確保 DOM 加載完成
document.addEventListener('DOMContentLoaded', function() {
    adjustContentHeight();
    // 當窗口大小改變時調整
    window.addEventListener('resize', adjustContentHeight);

    // 中間的寬度調整
    widthAdjustment();
    
    // 表格收合
    tableSystole();

    // 右側 table 添加拖動事件
    rightTableAddListen();

    // 左侧 table 添加拖動事件
    leftTableAddListen();

    // 加入trash-can的監聽器
    ashcan();

    //加入重設、自動填入、保存三個按鈕監聽器
    resetListen()
    autofillListen()
    saveListen();
});

//高度調整
function adjustContentHeight() {
    // 獲取 header 和 nav 的高度
    const headerHeight = document.querySelector('header').offsetHeight;
    const navHeight = document.querySelector('nav').offsetHeight;
    
    // 計算剩下的高度
    const totalHeight = window.innerHeight;
    const contentHeight = totalHeight - headerHeight - navHeight-10;
    
    // 設置 content 的高度
    document.querySelector('.content').style.height = contentHeight + 'px';
}

// 模組間移動科目
function moveSubject(event){
    console.log("拉動科目:", this.cells[2].innerText, this.cells[3].innerText);
    event.dataTransfer.setData('text/plain', this.dataset.id);
    event.dataTransfer.effectAllowed = 'move';
}
//呼叫伺服器移入Subject
function moveIn(body){
    fetch("http://localhost:8080/versions/canMove", {
        method: 'PUT',
        headers:{'Content-Type': 'application/json'},
        body: JSON.stringify(body),
    }).then(response =>{
        return response.text();
    }).then(text =>{
        if(text == "true"){
            updatePanel(body);
        }
        else{
            alert("該課程無法放入模組");
        }
    }).catch(err =>{
        console.log(err)
    });
}
//呼叫伺服器移出Subject
function moveOut(body){
    fetch("http://localhost:8080/versions/moveOut", {
        method: 'PUT',
        headers:{'Content-Type': 'application/json'},
        body: JSON.stringify(body),
    }).then(response =>{
        return response.text();
    }).then(text =>{
        updatePanel(body);
    }).catch(err =>{
        console.log(err)
    });

}
//更新畫面
function updatePanel(body){
    save = false;
    const checkbox = document.getElementById('is-learning');
    url = "http://localhost:8080/versions/leftPlane?courseStructureId=" + body.courseStructureId;
    fetch(url)
    .then(response =>{
        return response.text();
    }).then(text =>{
        document.getElementById('left-panel').outerHTML = text;
        //表格維持打開
        if(body.coursePackageId != null && body.courseModuleId != null){
            const moduleContainer = document.querySelector(`.module-container[data-package-id="${body.coursePackageId}"][data-module-id ="${body.courseModuleId}"]`);
            const moduleTable = moduleContainer.querySelector(`.module-table`);
            console.log(moduleTable);
            moduleTable.classList.add("expanded");
        }
        //重新添加事件
        widthAdjustment();
        tableSystole();
        leftTableAddListen();
        ashcan();
        resetListen();
        autofillListen();
        saveListen();
        if(checkbox.checked){
            showOnGoing();
        }
    })
    fetch("http://localhost:8080/versions/rightPlane")
        .then(response =>{
            return response.text();
        }).then(text =>{
            document.getElementById('right-panel').outerHTML = text;
            rightTableAddListen();
        }).catch(err =>{
            console.log(err)
        });
}

// 左侧的 table 添加拖動的放置事件
function leftTableAddListen(){
    const coursePackageTables = document.querySelectorAll('.module-table table');
    coursePackageTables.forEach(table => {          
        table.addEventListener('dragover', function(event){
            event.preventDefault();
        });
        table.addEventListener('drop', function(event) {
            var courseDataId = event.dataTransfer.getData('text/plain');
            const draggedRow = document.querySelector(`.right-panel table tbody tr[data-id="${courseDataId}"]`);
            const moveRow = document.querySelector(`#left-panel tbody tr[data-id="${courseDataId}"]`);
            let body = {
                "courseDataId":courseDataId,
                "coursePackageId": this.parentElement.parentElement.dataset.packageId,
                "courseModuleId": this.parentElement.parentElement.dataset.moduleId,
                "classModuleId": this.parentElement.parentElement.parentElement.dataset.id,
                "courseStructureId":document.getElementById("courseStructure").dataset.id
            };
            moveIn(body);
            // 增加 row 的 highlight 效果
            // const insertRow = this.querySelector('tbody tr');
            // insertRow.classList.add('highlight');        
            // 在一段时间后移除 highlight 效果 (0.3s)
            // setTimeout(() => {  insertRow.classList.remove('highlight');   }, 500);  
            console.log(draggedRow.cells[2].innerText,"科目拉至", this.parentElement.parentElement.querySelector('.module-name').innerText,"模組"); 
        });
    });
}
// 右側 table 添加拖動事件
function rightTableAddListen(){
    const SubjectTableRows = document.querySelectorAll('.right-panel table tbody tr');
    SubjectTableRows.forEach((row, index) => {
        row.addEventListener('dragstart', moveSubject);
    });
}

// 刪除模組中的科目
function trashListen(trashtd){
    const row = trashtd.closest('tr');
    const moduleContainer = trashtd.closest('.module-container');
    let body = {
        "courseDataId":row.dataset.id,
        "courseStructureId":document.getElementById("courseStructure").dataset.id,
        "coursePackageId": moduleContainer.dataset.packageId,
        "courseModuleId": moduleContainer.dataset.moduleId,
    };
    moveOut(body);

    
}

// 加入垃圾桶的監聽器
function ashcan(){
    document.querySelectorAll('.trash').forEach(icon => {
        icon.addEventListener('click', function(){trashListen(this)});
    });
}

// 中間的寬度調整
function widthAdjustment(){
    const divider = document.querySelector('.divider');
    const leftPanel = document.querySelector('#left-panel');
    const rightPanel = document.querySelector('.right-panel');
    let isResizing = false;
    divider.addEventListener('mousedown', function(e) {
        isResizing = true;
    });
    document.addEventListener('mousemove', function(e) {
        if (!isResizing) return;
        
        // 计算鼠标位置相对于窗口宽度的百分比
        const percentage = (e.clientX / document.body.offsetWidth) * 100;
        
        // 使用百分比设置左侧和右侧面板的宽度
        leftPanel.style.flexBasis = `${percentage}%`;
        rightPanel.style.flexBasis = `${100 - percentage}%`;
    });
    document.addEventListener('mouseup', function(e) {
        isResizing = false;
    });
}

// 表格收合
function tableSystole(){
    const headers = document.querySelectorAll('.module-header');
    headers.forEach(header => {
        header.addEventListener('click', function() {
            const content = this.nextElementSibling;
            // console.log(content)
            if (content.classList.contains('expanded')) {
                content.classList.remove('expanded');
                console.log("收合表格:",header.closest('.courseStructure').querySelector('.section-header').firstElementChild.innerText,header.querySelector('.module-name').innerText)
            } else {
                content.classList.add('expanded');
                console.log("展開表格:",header.closest('.courseStructure').querySelector('.section-header').firstElementChild.innerText,header.querySelector('.module-name').innerText)
            }
        });
    });
}

//重設
function resetListen(){
    var button = document.getElementById("reset");
    body = {
        "courseStructureId":document.getElementById("courseStructure").dataset.id
    };
    url = "http://localhost:8080/versions/reset?courseStructureId=" + body.courseStructureId;
    button.addEventListener('click', function(){
        fetch(url, {
            method:'GET',
        })
        .then(response =>{
            return response.text();
        }).then(text =>{
            updatePanel(body);
        }).catch(err =>{
            console.log(err)
        });
    });
}
//自動填充
function autofillListen(){
    var button = document.getElementById("autofill");
    button.addEventListener('click', function(){
        fetch("http://localhost:8080/versions/autofill", {
            method:'GET',
        })
        .then(response =>{
            return response.text();
        }).then(text =>{
            console.log(text);
            let body = {
                "courseStructureId":document.getElementById("courseStructure").dataset.id,
            };
            updatePanel(body);
        }).catch(err =>{
            console.log(err)
        });
    });
}
//保存
function saveListen(){
    var button = document.getElementById("save");
    button.addEventListener('click', function(){
        fetch("http://localhost:8080/versions/save", {
            method:'PUT',
        })
        .then(response =>{
            return response.text();
        }).then(text =>{
            save = true;
        }).catch(err =>{
            console.log(err)
        });
    });

}
