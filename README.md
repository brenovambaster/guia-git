
<br>

<h1 align="center"> Guia prático de Git e Github</h1>
<p align="center"> Para Iniciantes </p>

<p align="center"> 
    <img  src="./img/git.png" alt="git"> 
</p>


<p align="center">
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License MIT">
  </a>

  
   <img alt="Git" src="https://img.shields.io/badge/Git-red">

   <img alt="GitHub" src="https://img.shields.io/badge/Github-success">
   <img alt="author" src="https://img.shields.io/badge/Author-Breno%20Vamb%C3%A1ster-important">
</p>
<br>

__Esse é apenas um guia com comandos básicos, ainda se faz nescessário ler o livro (disposto detro das notas) ou estudar por outra fonte.__

___Para aqueles que quiserem contribuir com esse repositório, fique a vontade, basta dar um fork e criar uma pull request.___

___Ainda está em andamento...___

## 0 Notas:  
 
* O Livro gratuito para aprender git: http://git-scm.com/book/pt-br/v2

* Após baixado, instalado e configurado o git, vamos criar o nosso primeiro repositório.


## 1 Inicializando o repositório local
``` 
> git init
```
<p>Com esse comando você cria o seu repositório local e está pronto para clonar ou criar o seu projeto.</p>

## 2 Verificar o status do repositório
```
> git status
``` 
 Lista todas as alterações e estado de arquivos ou repositórios. Para todo arquivo ou diretório modificado, ao dar o comando `git status` , mostrará  os arquivos prontos para serem adicionados ao _Index_   

## 3 Adicionar os arquivos/diretórios modificados ao *Index*.
Para adicionarmos __um arquivo__, usamamos:     
```
> git add name_file.js
```
Para adicionarmos __vários arquivos__, usamos: 
```
> git add name_file.js file2.js file3.js
```
Para __todos os arquivos__ modificados, usamos 
```
> git add .
```
Após adicionarmos os arquivos e diretórios modificados ao _Index_, precisamos confirmá-los ou `commit`. 

![tree](./img/trees.png)

## 4 Comitar arquivo / diretório
Comitar apenas um arquivo:
```
> git commit meu_arquivo.txt -m"messagem para o commit"
```









