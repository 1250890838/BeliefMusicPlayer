function checkIfNewPageIsTheSameAsOld(sidebarItem) {
    return sidebar.currentItem === sidebarItem
}

function terminateActionOfCurrentPage(page, sidebarItem) {
    let currentPage = pageManager.currentItem
    return true
}

function switchPage(page, sidebarItem=null,isTrack=true) {
    if(pageManager.currentItem===page)
        return
    pageManager.currentItem.visible=false
    pageManager.replace(page)
    page.visible=true
    if(sidebarItem!==null){
        sidebar.changeSelectedItem(sidebarItem)
    }
    else{
        if(sidebar.currentItem==null){
            return
        }
        sidebar.currentItem.selected=false
        sidebar.currentItem = null
    }
    if(isTrack){
        pushOperation(function(){
            switchPage(page,sidebarItem,false)
        })
    }
}

function pushOperation(func){
    window.operationTrackList.push(func)
}

function prevOperation(){
    let length=window.operationTrackList.length
    if(length<=1) return
    window.operationTrackList.pop()
    const operation=window.operationTrackList[length-2]
    operation()
}



