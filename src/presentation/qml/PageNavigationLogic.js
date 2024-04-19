function checkIfNewPageIsTheSameAsOld(sidebarItem) {
    return sidebar.currentItem === sidebarItem
}

function terminateActionOfCurrentPage(page, sidebarItem) {
    let currentPage = pageManager.currentItem
    return true
}

function switchPage(page, sidebarItem) {
    pageManager.replace(page)
    sidebar.changeSelectedItem(sidebarItem)
}
