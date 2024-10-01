document.addEventListener('DOMContentLoaded', function(){
    // 中間的寬度調整
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

    // 表格收合
    const headers = document.querySelectorAll('.module-header');
    headers.forEach(header => {
        header.addEventListener('click', function() {
            const content = this.nextElementSibling;
            // console.log(content)
            if (content.classList.contains('expanded')) {
                content.classList.remove('expanded');
                console.log("收合表格:",header.closest('.courseClass').querySelector('.section-header').firstElementChild.innerText,header.querySelector('.module-name').innerText)
            } else {
                content.classList.add('expanded');
                console.log("展開表格:",header.closest('.courseClass').querySelector('.section-header').firstElementChild.innerText,header.querySelector('.module-name').innerText)
            }
        });
    });

    // 顯示/隱藏'正在修
    const checkbox = document.getElementById('is-learning');
    checkbox.addEventListener('change', function() {
        let infoExtras = document.querySelectorAll('.info-extra');
        infoExtras.forEach(function(infoExtra) {
            infoExtra.classList.toggle('expanded');
            console.log("顯示/隱藏'正在修'")
        });

     });

    // 版本收合
    const toggleBtn = document.querySelector('.fa-list');
    const setversion = document.querySelector('.setVersion');
    toggleBtn.addEventListener('click', function(){
        setversion.classList.toggle('expanded');
    });

    // 按nav時展開不同課程類別
    // const NavcourseClasss = document.querySelectorAll('.active');
    // NavcourseClasss.forEach(NavcourseClass => {
    //     NavcourseClass.addEventListener('click',function(){
    //         const DivcourseClass = document.querySelector(`.courseClass.${NavcourseClass.id}`);
    //         // 有點其他課程類別才做事
    //         if(!DivcourseClass.classList.contains('expanded')){
    //             // 改 nav 的顏色
    //             NavcourseClasss.forEach(NavcourseClass =>{
    //                 NavcourseClass.classList.remove('clicked');
    //             });
    //             this.classList.add('clicked');
    //             // 打開對應的左側table
    //             document.querySelectorAll('.courseClass').forEach(courseClass =>{
    //                 courseClass.classList.remove('expanded');
    //             });
    //             DivcourseClass.classList.add('expanded');
    //             // 點選總覽時，要隱藏content
    //             if(this.id === 'totalView'){
    //                 document.querySelector('.content').classList.add('hide');
    //             }else{
    //                 document.querySelector('.content').classList.remove('hide');
    //                 console.log('展開',this.innerHTML);
    //             }
    //         }
    //     });
    // });

    // 算學分數並改顏色
    const AllcoursePackages = document.querySelectorAll('.coursePackages');
    AllcoursePackages.forEach(coursePackages => {
        coursePackages.querySelectorAll('.module-table').forEach(coursePackageTable => {
            
            calculateCoursePackageCredits(coursePackageTable.parentElement);
            changeCoursePackageColor(coursePackageTable.parentElement);
            // 创建观察器实例
            const coursePackageTablesobserver = new MutationObserver(() => {
                // 当表格内容发生变化时，执行学分计算和颜色更改
                calculateCoursePackageCredits(coursePackageTable.parentElement); 
                changeCoursePackageColor(coursePackageTable.parentElement);
                calculatecourseClassMoCredits(coursePackages);
                changecourseClassscolor(coursePackages.closest('.courseClass'));
            });
            // 配置 MutationObserver 监听的选项
            const coursePackagesconfig = {
                childList: true,  // 监听子节点的变化
                subtree: true,    // 监听所有后代节点的变化
                characterData: true // 监听文本变化
            };
            // 开始监听当前 div 的变化
            coursePackageTablesobserver.observe(coursePackageTable, coursePackagesconfig);
            
        });
        calculatecourseClassMoCredits(coursePackages);
        changecourseClassscolor(coursePackages.closest('.courseClass'));
    });

    // 拉科目
    const SubjectTableRows = document.querySelectorAll('.right-panel table tbody tr');
    const coursePackageTables = document.querySelectorAll('.module-table table');
        // 右側科目的table，每row設置一個 data-id 來標識
    SubjectTableRows.forEach((row, index) => {
        if(row.closest('table').id != 'unpass'){
            row.setAttribute('draggable', 'true');
        }
        row.dataset.id = `row-${index}`;
        // 当开始拖动时，傳data到event.dataTransfer的物件
        row.addEventListener('dragstart', function(event) {
            console.log("拉動科目:", row.cells[2].innerText); 
            event.dataTransfer.setData('text/plain', row.dataset.id);
            event.dataTransfer.effectAllowed = 'move';
        });
    });
    //左侧的 table 添加拖動的放置事件
    coursePackageTables.forEach(table => {
        table.querySelectorAll('tbody tr').forEach( row => {
            row.addEventListener('dragstart',moveSubject);
        });            
        table.addEventListener('dragover', function(event) {
            // T/F 由後端判斷
            a=true
            if(a){
                event.preventDefault();
            }else{
                console.log("此模組不採計此科目!")
            }
        });
        table.addEventListener('drop', function(event) {
            const rowId = event.dataTransfer.getData('text/plain');
            const draggedRow = document.querySelector(`.right-panel table tbody tr[data-id="${rowId}"]`);
            const moveRow = document.querySelector(`#left-panel tbody tr[data-id="${rowId}"]`);
            // 在模組table中插入 科目            
            if(!moveRow) {
                const copyRow = draggedRow.cloneNode(true);
                //移除class=connected的column
                copyRow.querySelector(".connected").remove();
                // 加入trash icon
                copyRow.insertAdjacentHTML('beforeend', `
                    <td class="trash">
                    <i class="fa-regular fa-trash-can trash-can" style="color: #e54848;"></i>
                    </td>`);
                //將課程加入模組
                this.querySelector('tbody').insertAdjacentHTML('afterbegin', copyRow.outerHTML);
                //加入trash監聽器
                this.querySelector('tbody tr').querySelector('.trash').addEventListener('click', 
                    function(){trashListen(this)}
                );
                //正在修
                if(Number.isNaN(copyRow.cells[4].innerText)){
                    this.querySelector('tbody tr').className = "info-extra expanded";
                }                
                // 科目已拉成功且隱藏
                draggedRow.style.display = 'none';
                draggedRow.querySelector('.connected').innerText=1;
                
            }else{
                // 模組間互拉科目
                this.querySelector('tbody').insertAdjacentHTML('afterbegin', moveRow.outerHTML);
                // moveRow.removeEventListener('dragstart',moveSubject);
                moveRow.remove();
            }
            // 加入能在模組間移動科目的監聽器
            this.querySelector('tbody tr').addEventListener('dragstart',moveSubject);
            //加入trash監聽器
            this.querySelector('tbody tr').querySelector('.trash').addEventListener('click', 
                function(){trashListen(this)}
            );
            // 增加 row 的 highlight 效果
            const insertRow = this.querySelector('tbody tr');
            insertRow.classList.add('highlight');        
            // 在一段时间后移除 highlight 效果 (0.3s)
            setTimeout(() => {  insertRow.classList.remove('highlight');   }, 500);  
            console.log(draggedRow.cells[2].innerText,"科目拉至", this.parentElement.parentElement.querySelector('.module-name').innerText,"模組"); 
        });
    });

    // 初次調整
    adjustContentHeight();
    
    // 當窗口大小改變時調整
    window.addEventListener('resize', adjustContentHeight);
    
    // 加入trash-can的監聽器
    document.querySelectorAll('.trash').forEach(icon => {
        icon.addEventListener('click', function(){trashListen(this)});
    });

    模組間移動科目
    function moveSubject(event){
        let table = this.closest('table');
        console.log(
            "拉動",table.closest('.module-container').querySelector('.module-name').innerText,
            "模組的科目", this.cells[1].innerText);
        event.dataTransfer.setData('text/plain', this.dataset.id);
        event.dataTransfer.effectAllowed = 'move';
    };

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
    // 課程組合(coursePackages / module-container) 學分計算
    function calculateCoursePackageCredits(moduleContainer) {
        let totalRequired = 0;  // 已修必修
        let totalElective = 0;  // 已修選修
        let extraRequired = 0;  // 正在修必修
        let extraElective = 0;  // 正在修選修
        const rows = moduleContainer.querySelectorAll('.module-table tbody tr');
        
        rows.forEach(row => {
            const type = row.cells[3].innerText; // 選別
            const credit = parseInt(row.cells[4].innerText, 10); // 學分數
            const score = row.cells[5].innerText; // 分數
            // 不包含正在修
            if(!isNaN(score)){
                if (type === '必') {
                    totalRequired += credit;
                } else if (type === '選') {
                    totalElective += credit;
                }
            }
            // 包含正在修
            if (type === '必') {
                extraRequired += credit;
            } else if (type === '選') {
                extraElective += credit;
            }
        });
        moduleContainer.querySelector('.NowRequiredCredit').innerText = `${totalRequired}`;
        moduleContainer.querySelector('.NowElectiveCredit').innerText = `${totalElective}`;
        moduleContainer.querySelector('.ExtraRequiredCredit').innerText = `${extraRequired}`;
        moduleContainer.querySelector('.ExtraElectiveCredit').innerText = `${extraElective}`;
    }
    // 總覽學分連結
    function Viewcredit(moduleContainer){
        // 获取 moduleContainer 的 classList 并转换为选择器字符串
        const classList1 = Array.from(moduleContainer.classList).map(cls => `.${cls}`).join('');
        let targetIndex = -1;
        document.querySelectorAll('.classModule th').forEach((classModuleth, index) => {
            // 检查表头的 class 是否包含 "classModule-4"
            if (classModuleth.contains('classModule-4')) {
                targetIndex = index;
            }
        });
        moduleContainer.parentElement.querySelectorAll(classList1).forEach( TheSameClassModule =>{
            
        });
            // document.querySelector(`.totalView .${moduleContainer.classList[1]}`)

            // });
    }
    // document.querySelector(`.totalView ${courseClass.id} NowModuleCredit`).innerText = `${NowModuleCredit}`;
    // document.querySelector(`.totalView ${courseClass.id} ExtraModuleCredit`).innerText = `${ExtraModuleCredit}`;
    // document.querySelector(`.totalView ${courseClass.id} ModuleCredit`).innerText = `${ModuleCredit}`;
    // document.querySelector(`.totalView ${courseClass.id} pass`).innerText = "P";

    // 改變 課程組合(coursePackages / module-container) 的顏色
    function changeCoursePackageColor(moduleContainer){
        moduleContainer.firstElementChild.classList.remove('coursePackagepass', 'coursePackagelearningpass', 'coursePackageunpass');
        if(Number(moduleContainer.querySelector('.NowRequiredCredit').innerText) >=
        Number(moduleContainer.querySelector('.RequiredCredit').innerText) & 
        Number(moduleContainer.querySelector('.NowElectiveCredit').innerText) >=
        Number(moduleContainer.querySelector('.ElectiveCredit').innerText) ){
            moduleContainer.firstElementChild.classList.add('coursePackagepass');
        }else if(Number(moduleContainer.querySelector('.ExtraRequiredCredit').innerText) >=
        Number(moduleContainer.querySelector('.RequiredCredit').innerText) & 
        Number(moduleContainer.querySelector('.ExtraElectiveCredit').innerText) >=
        Number(moduleContainer.querySelector('.ElectiveCredit').innerText) ){
            moduleContainer.firstElementChild.classList.add('coursePackagelearningpass');
        }else{
            moduleContainer.firstElementChild.classList.add('coursePackageunpass');
        }
    }
    // document.querySelector(`.totalView ${courseClass.id} unpass`).innerText = "P";

    // 課程類別(courseClass)中全部課程組合(coursePackages) 的學分計算  
    function calculatecourseClassMoCredits(coursePackages){
        const SubcoursePackage = coursePackages.querySelectorAll('.module-container');
        let NowModuleCredit = 0;
        SubcoursePackage.forEach( coursePackage => {
            const NowRequiredCredit = Number(coursePackage.querySelector('.NowRequiredCredit').innerText);
            const RequiredCredit = Number(coursePackage.querySelector('.RequiredCredit').innerText);
            const NowElectiveCredit = Number(coursePackage.querySelector('.NowElectiveCredit').innerText);
            const ElectiveCredit = Number(coursePackage.querySelector('.ElectiveCredit').innerText);
            // 已通過
            (NowRequiredCredit > RequiredCredit) ? (NowModuleCredit += RequiredCredit) : (NowModuleCredit += NowRequiredCredit);
            (NowElectiveCredit > ElectiveCredit) ? (NowModuleCredit += ElectiveCredit) : (NowModuleCredit += NowElectiveCredit);            
        });
        coursePackages.querySelector('.NowModuleCredit').innerText = `${NowModuleCredit}`;
    }
    
    // 改變 課程類別(courseClass) 顏色
    function changecourseClassscolor(courseClass){
        if(Number(courseClass.querySelector('.NowModuleCredit').innerText) >=
        Number(courseClass.querySelector('.ModuleCredit').innerText)){
            courseClass.classList.add('pass');
        }else{
            courseClass.classList.remove('pass');
            
        }
    }

    // 刪除模組中的科目
    function trashListen(trashtd){
        const row = trashtd.closest('tr');
        rightRow = document.querySelector(`.right-panel tbody tr[data-id="${row.dataset.id}"]`);
        if (rightRow) {
            const connectedElement = rightRow.querySelector('.connected')
            // 將減去1後的值並存回connected中
            let currentValue = parseInt(connectedElement.textContent, 10);
            currentValue--;
            connectedElement.textContent = currentValue;
            rightRow.style.display = "table-row";
            row.remove();
            console.log("成功刪除");

        } else {
            console.log(".connected 元素未找到");
        }
    }

});
