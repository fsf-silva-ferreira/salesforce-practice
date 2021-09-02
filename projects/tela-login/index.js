var nameUser = "Flávio"; //Nome do usuário cacastrado
var pass = "182703"; // Senha cadastrada

function getData() {
    var name = '';
    var password = '';
    var userOK;
    var passOK;

    name = document.getElementById('username').value; //Pegar o valor do campo usuário
    password = document.getElementById('password').value; //Pegar valor do campo senha

    if(name.length > 0) { //Verificar se tem conteúdo no campo usuário
        if(name == nameUser) {//Verificar se o usuário inserido é igual ao usuário cadastrado
            userOK = true;
        }
    } else { //Caso não tenha informado a senha
        alert('O valor do usuário está em branco');
    }

    if(password.length > 0) { //Verificar se tem conteúdo no campo senha
        if(password == password) {//Verificar se o usuário inserido é igual à senha cadastrado
            passOK = true;    
        }   
    } else {
        alert('O valor da senha está em branco');
    }

    if(userOK == true && passOK == true) {// Verificar se pode logar
        alert('Logado com sucesso!!');
        //window.location.href("https://www.google.com/"); não funcionou, ver depois
        window.location.href = 'https://www.gft.com/br/pt/index/';
    } else {// Caso não possa logar
        alert('Usuário ou senha incorreta! :(');   
    }
}