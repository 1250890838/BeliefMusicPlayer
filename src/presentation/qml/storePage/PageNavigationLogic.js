function checkIfNewPageIsTheSameAsOld(item) {
    return tabbar.currentItem === item
}

function switchPage(page, tabbarItem,isTrack=true) {
    if(paneManager.currentItem===page)
        return
    paneManager.currentItem.visible=false
    paneManager.replace(page)
    page.visible=true
    console.log(`tabbar object : ` + tabbar)
    console.log(`paneManager object :` + paneManager)
    tabbar.changeCurrentItem(tabbarItem)
    if(isTrack){
        window.operationTrackList.push(function(){
            window.loadPageFromSideBar(storePage,null,false)
            switchPage(page,tabbarItem,false)
        })
    }
}

