// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function validatePassword(){
    let password = document.getElementById("password").value;
    let resultado = document.getElementById("resultado");
    var passwordRegExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/;
    if (passwordRegExp.test(password)){
        resultado.innerHTML  = "Contraseña Correcta";
        resultado.style.display = "flex";
        resultado.style.justifyContent = "center";
        resultado.style.padding = "5px 10px";
        resultado.style.border = "2px solid green";
        resultado.style.backgroundColor = "#c6faa7";
        resultado.style.color = "green";
        console.log("true");
        return true;
    }else {
        /*Agregar clase de DOM*/
        resultado.innerHTML = "Contraseña Incorrecta";
        resultado.style.display = "flex";
        resultado.style.justifyContent = "center";
        resultado.style.padding = "5px 10px";
        resultado.style.border = "2px solid red";
        resultado.style.color = "red";
        resultado.style.backgroundColor = "#fcacb3";
        return false;
    }
}

function dotifyPassword(password){
    var to;
    var fields = document.querySelectorAll('[type=fancyPassword]');
    Array.from(fields).forEach(ele=>{
      ele.setAttribute("data-value", "");
      ele.addEventListener('keyup', function(){
          if(to) clearTimeout(to);
          if(!this.value.length) return;
          var typed = this.value.split('').pop();
          this.setAttribute("data-value", this.getAttribute("data-value")+typed);
          this.value = "•".repeat(this.value.length-1)+typed;
          to = setTimeout(()=>this.value = "•".repeat(this.value.length),500);
      });
    });
  }

  function showPassword(){
    var x = document.getElementById("contrasena")
    if(x.type === "password"){
        x.type = "text";
    }else {
        x.type = "password";
    }
  }