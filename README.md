
<br>

<h1 align="center"> Guia prático de Git e Github</h1>
<p align="center"> Para Iniciantes </p>

<p align="center"> 
    <img  src="./img/git2.png" alt="git" height="200px"> 
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

___Para aqueles que quiserem contribuir com esse repositório, fique à vontade, basta dar um fork e criar uma pull request.___

___Ainda está em andamento...___
___



|  Índice||
|---|---|
| [0. Notas](#0-notas) |[8. Merge]()   |
| [1. Init](#1-inicializando-o-repositório-local) | [9. Title ]()   |
| [2. Status](#2-verificar-o-status-do-repositório) | [10. Title]()| 
|[3. Add](#3-adicionar-os-arquivos-ou-diretórios-modificados-ao-index) |[11. Title]() |
| [4. Commit](#4-comitar-arquivo-ou-diretório)| [12. Title]()|
| [5. Log e show](#5-visualizando-alterações)|  [13. Title]() |
| [6. Checkout](#6-checkout)| [14. Title]()|   
| [7. Reset](#6-checkout)| [15. Title]()|   
   
   
   
  
   

___

## 0 Notas:  
 
* O Livro gratuito para aprender git: http://git-scm.com/book/pt-br/v2

* Após baixado, instalado e configurado o git, vamos criar o nosso primeiro repositório.


## 1 Inicializando o repositório local
```shell
$ git init
```
<p>Com esse comando você cria o seu repositório local e está pronto para clonar ou criar o seu projeto.</p>

## 2 Verificar o status do repositório
```shell
$ git status
``` 
 Lista todas as alterações e estado de arquivos ou repositórios. Para todo arquivo ou diretório modificado, ao dar o comando `git status` , mostrará  os arquivos prontos para serem adicionados ao _index_   

## 3 Adicionar os arquivos ou diretórios modificados ao *Index*
Para adicionarmos __um arquivo__, usamamos:     
```shell
$ git add name_file.js
```
Para adicionarmos __vários arquivos__, usamos: 
```shell
$ git add name_file.js file2.js file3.js
```
Para __todos os arquivos__ modificados, usamos 
```shell
$ git add .
```
> **Remover arquivo do _Index_:** Após ter adicionado o arquivo ao Index (com o **`git add .`** )  é possível removê-lo com o comando `git reset HEAD file_name.txt`

Após adicionarmos os arquivos e diretórios modificados ao _Index_, precisamos confirmá-los ou `commit`. 

![tree](./img/trees.png)

## 4 Comitar arquivo ou diretório
  Comitar apenas um arquivo:
  ```shell
  $ git commit meu_arquivo.txt -m"messagem para o commit"
  ```

  Comitar vários arquivos:
  ```shell
  $ git commit -m"messagem para o commit"
  ```

## 5 Visualizando alterações
  - ### log
    Mostras os logs dos commits, informações relevantes sobre cada commit.
    Veremos  a saida do seguinte comando:
    
    ```shell 
      $ git log
      > commit 2a3f2b6245********** // hash
        Author: Breno Vambáster 
        Date:   Tue Jul 20 09:49:58 2021 -0300
        Update README.md
    ``` 

    ```shell 
      $ git log --graph  //mostra de forma gŕafica as branchs
    ``` 
  - ### show  
    Com a hash do commit supracitado é possível ver informações adicionais e relevantes do commit em questão. Esse comando mostra as alterações feita no arquivo.
    Por exemplo:

    ```shell 
      $ git show 2a3f2b6245
      commit 2a3f2b6245e**********
      Author: Breno Vambáster
      Date:   Tue Jul 20 09:49:58 2021 -0300
          
          Update README.md

      diff --git a/README.md b/README.md
      index 5288420..6906631 100644
      --- a/README.md
      +++ b/README.md
      @@ -5,7 +5,7 @@
      <p align="center"> Para Iniciantes </p>
      
      <p align="center"> 
      -    <img  src="./img/git.png" alt="git"> 
      +    <img  src="./img/git2.png" alt="git" height="200px"> 
      </p>
    ``` 

  - ### diff
    Mostra as mudanças no arquivo depois de adicionado ao stage (`git add .`) antes mesmo de ser "commitdado".
    Como usar: 
    ```shell  
    $ git diff 
    ``` 




## 6 Checkout
  O checkout é o jeito mais fácil para desfazer alterações. Supondo que você editou o arquivo.txt e quer voltá-lo para seu estado original desde o último commit. Use:
  ```shell
    $ git checkout -- arquivo.txt
  ```
  Mais pra frente veremos que o `git checkout` também pode ser usado para outros fins, por exemplo, mudar de branch.

## 7 Reset: Desfazendo commits
  Há duas formas de usarmos o `git reset`: 
  * Note que o commit será desfeito, mas as alterações feitas nos arquivos permanecerão prontas para serem comitadas novamente( no stage ou index). Ao usar o `git reset` a opção padrão é a `--soft`.
    ```shell
    $ git reset HEAD~1
    ``` 
  
  * No caso a seguir, as alterações nos arquivos também serão desfeitas juntamente com o commit.
    ```shell 
    $ git reset --hard HEAD~1
    ``` 







<br><br><br><br><br><br>
<h2 align="center"> Repositórios remotos<h2>