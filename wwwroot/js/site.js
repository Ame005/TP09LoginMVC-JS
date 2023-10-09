// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function validatePassword(password){
    var passwordRegExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/;
    if (passwordRegExp.test(password)){
        return true;
    }else {
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