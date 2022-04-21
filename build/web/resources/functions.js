/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validation(forma){
    var user = forma.user;
    if(user.value == "" || user.value == "Write your user"){
        alert("You must write a user");
        user.focus();
        user.select();
        return false;
    }
   
    
   
    var rating = forma.rating;
    var checkSelected = false;
   
    for(var i = 0; i < rating.length; i++){
        if(rating[i].checked){
            checkSelected = true;
        }
    }
   
    if(!checkSelected){
        alert("You must rate the web page");
        return false;
    }
   
    var answers = forma.answer;
    var selectedBox = false;
   
    for(var i = 0; i < answers.length; i++){
        if(answers[i].checked){
            selectedBox = true;
        }
    }
   
    if(!selectedBox){
        alert("You must provide an answer");
        return false;
    }
   
    
   
    //Formulario es valido
    alert("Valid Form");
    return true;
}
