function checkIfNewPageIsTheSameAsOld(sidebarItem) {
    return sidebar.currentItem === sidebarItem
}

function terminateActionOfCurrentPage(page, sidebarItem) {
    let currentPage = pageManager.currentItem
    return true
}

function switchPage(page, sidebarItem=null) {
    pageManager.replace(page)
    operationTrackList.push(page)
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
}

