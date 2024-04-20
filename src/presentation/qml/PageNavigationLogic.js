function checkIfNewPageIsTheSameAsOld(sidebarItem) {
    return sidebar.currentItem === sidebarItem
}

function terminateActionOfCurrentPage(page, sidebarItem) {
    let currentPage = pageManager.currentItem
    return true
}

function switchPage(page, sidebarItem=null) {
    pageManager.replace(page)
    if(sidebarItem!==null){
        sidebar.changeSelectedItem(sidebarItem)
    }
}

