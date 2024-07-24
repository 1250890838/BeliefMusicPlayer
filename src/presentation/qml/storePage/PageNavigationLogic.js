function checkIfNewPageIsTheSameAsOld(item) {
    return tabbar.currentItem === item
}

function switchPage(page, tabbarItem,isTrack=true) {
    if(paneManager.currentItem===page){
        console.log ("21232131")
        return
    }
    paneManager.currentItem.visible=false
    paneManager.replace(page)
    page.visible=true
    tabbar.changeCurrentItem(tabbarItem)
    if(isTrack){
        window.operationTrackList.push(function(){
            window.loadPageFromSideBar(storePage,sidebar.storeItem,false)
            switchPage(page,tabbarItem,false)
        })
    }
}

