/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


let btn = document.querySelector("#btn");
let sidebar = document.querySelector(".siderbar");
let search = document.querySelector(".bx-search");

btn.onclick = function(){
    sidebar.classList.toggle("active");
}

search.onclick = function(){
    sidebar.classList.toggle("active");
}

