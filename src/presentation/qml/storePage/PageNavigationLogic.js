function checkIfNewPageIsTheSameAsOld(item) {
    return tabbar.currentItem === item
}

function switchPage(page, tabbarItem) {
    paneManager.replace(page)
    tabbar.changeCurrentItem(tabbarItem)
}

