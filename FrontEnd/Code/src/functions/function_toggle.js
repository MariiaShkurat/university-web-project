export const toggle_menu = () => {
    let menuList = document.getElementById("menuList");

    if (menuList.style.maxHeight === "0px") {
        menuList.style.maxHeight = "380px";
    } else {
        menuList.style.maxHeight = "0px";
    }
}

export const start_toggle = () => {
    let menuList = document.getElementById("menuList");
    menuList.style.maxHeight = "0px";
}