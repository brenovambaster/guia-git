# Guia Prático de Git e GitHub Para Iniciantes

<p align="center">
  <img src="./img/git2.png" alt="git" height="200px">
</p>

<p align="center">
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License MIT">
  </a>
  <img alt="Git" src="https://img.shields.io/badge/Git-red">
  <img alt="GitHub" src="https://img.shields.io/badge/GitHub-success">
  <img alt="Author" src="https://img.shields.io/badge/Author-Breno%20Vamb%C3%A1ster-important">
</p>

> **Observação:**  
> Este guia reúne os principais comandos e fluxos de trabalho do Git, servindo como material de apoio para iniciantes e para quem deseja aprimorar seu conhecimento. Para um estudo mais aprofundado, recomendamos a leitura do [Livro Gratuito de Git](http://git-scm.com/book/pt-br/v2).

> **Contribuições:**  
> Se você deseja ajudar a aprimorar este guia, sinta-se à vontade para realizar um fork e submeter uma pull request. Confira as diretrizes de contribuição para mais detalhes.

---

## Índice

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Guia Prático de Git e GitHub Para Iniciantes](#guia-prático-de-git-e-github-para-iniciantes)
  - [Índice](#índice)
  - [0. Notas](#0-notas)
  - [Conceitos Básicos: HEAD, Index e Working Directory](#conceitos-básicos-head-index-e-working-directory)
  - [1. Inicializando o Repositório e Configurando o Usuário](#1-inicializando-o-repositório-e-configurando-o-usuário)
  - [2. Verificando o Status do Repositório](#2-verificando-o-status-do-repositório)
  - [3. Adicionando Arquivos ao Index](#3-adicionando-arquivos-ao-index)
  - [4. Comitando Alterações](#4-comitando-alterações)
    - [4.1 Editando a Mensagem do Commit](#41-editando-a-mensagem-do-commit)
  - [5. Visualizando Alterações](#5-visualizando-alterações)
    - [5.1 git log](#51-git-log)
    - [5.2 git show](#52-git-show)
    - [5.3 git diff](#53-git-diff)
    - [5.4 git remote](#54-git-remote)
  - [7. Restaurando Alterações com git restore](#7-restaurando-alterações-com-git-restore)
    - [7.1 Restaurar um Arquivo do Working Directory](#71-restaurar-um-arquivo-do-working-directory)
  - [7.2 Restaurar um Arquivo no Index](#72-restaurar-um-arquivo-no-index)
  - [6. Revertendo Alterações com Checkout](#6-revertendo-alterações-com-checkout)
  - [7. Desfazendo Commits com Reset](#7-desfazendo-commits-com-reset)
  - [8 Mesclando Alterações com Merge](#8-mesclando-alterações-com-merge)
  - [9 Chave SSH: O que é e como Gerar?](#9-chave-ssh-o-que-é-e-como-gerar)
    - [9.1 - Inicialmente vamos gerar uma nova chave (Será necessário utilizar o email o qual está vinculado ao GitHub para gerar a chave)](#91---inicialmente-vamos-gerar-uma-nova-chave-será-necessário-utilizar-o-email-o-qual-está-vinculado-ao-github-para-gerar-a-chave)
    - [9.2 - Adicionando Chave SSH ao GitHub](#92---adicionando-chave-ssh-ao-github)
    - [9.3 - Validando chave SSH](#93---validando-chave-ssh)
    - [Caso tenha algum problema...](#caso-tenha-algum-problema)
  - [12. Trabalhando com Branches](#12-trabalhando-com-branches)
    - [12.1 Listando Branches](#121-listando-branches)
    - [12.2 Criando uma Nova Branch](#122-criando-uma-nova-branch)
    - [12.3 Trocando de Branch](#123-trocando-de-branch)
    - [12.4 Renomeando uma Branch](#124-renomeando-uma-branch)
    - [12.5 Excluindo uma Branch](#125-excluindo-uma-branch)
    - [Boas Práticas:](#boas-práticas)
  - [13. Repositórios Remotos](#13-repositórios-remotos)
    - [13.1 Clonando um Repositório](#131-clonando-um-repositório)
    - [13.2 Adicionando um Repositório Remoto](#132-adicionando-um-repositório-remoto)
    - [13.3 Enviando Alterações para o Remoto (Push)](#133-enviando-alterações-para-o-remoto-push)
    - [13.4 Recebendo Alterações do Remoto (Pull)](#134-recebendo-alterações-do-remoto-pull)
    - [13.5 Buscando Alterações sem Fazer Merge (Fetch)](#135-buscando-alterações-sem-fazer-merge-fetch)

<!-- /code_chunk_output -->

## 0. Notas

- **Livro Gratuito:**  
  [Aprenda Git - Livro Oficial](http://git-scm.com/book/pt-br/v2)

- **Recomendação:**  
  Após instalar e configurar o Git, pratique criando repositórios locais e experimente os comandos básicos para compreender o fluxo de trabalho.

---

## Conceitos Básicos: HEAD, Index e Working Directory

Antes de mergulhar nos comandos, é importante entender os três principais "estágios" no Git:

- **Working Directory (Diretório de Trabalho):**  
  É a pasta do seu projeto, onde você edita os arquivos. Qualquer modificação feita aqui não é registrada no Git até que você as adicione ao _staging_.

- **Index (ou Staging Area):**  
  É uma área intermediária onde os arquivos modificados são preparados para o commit. Ao usar o comando `git add`, você está movendo as alterações do Working Directory para o Index.

- **HEAD:**  
  Aponta para o commit atual (a "foto" mais recente do seu repositório). Quando você realiza um commit, o HEAD se move para o novo commit criado.

Compreender esses conceitos ajuda a entender melhor como os comandos do Git interagem com seus arquivos.

![Git](./img/trees.png)

---

## 1. Inicializando o Repositório e Configurando o Usuário

Antes de iniciar, é fundamental configurar seu nome de usuário e email. Essas informações identificarão os autores dos commits. **Dica:** Utilize o mesmo nome e email do seu perfil no GitHub.

```shell
  git config --global user.email "seuemail@mail.com"
  git config --global user.name "Seu Nome"
```
Para conferir as configurações realizadas, execute:

```shell
  git config --list
```

Caso precise remover alguma configuração, use:

```shell
  git config --global --unset user.email
  git config --global --unset user.name
```

Agora, crie o repositório local:
```shell 
  git init
```

## 2. Verificando o Status do Repositório

Utilize o comando abaixo para visualizar o estado atual do seu repositório, identificando arquivos modificados, novos ou prontos para commit:

```shell
git status
```

## 3. Adicionando Arquivos ao Index

O comando `git add` prepara os arquivos para o commit.

- Adicionar um arquivo específico:

```shell
  git add nome_do_arquivo.js
```

- Adicionar múltiplos arquivos:

```shell
  git add arquivo1.js arquivo2.js arquivo3.js
```

- Adicionar todos os arquivos modificados:

```shell
  git add .
```

>  Se Se adicionar um arquivo por engano, remova-o do index com:
  ```shell 
    git reset HEAD nome_do_arquivo.txt
  ```

## 4. Comitando Alterações

Após adicionar os arquivos, confirme as alterações com um commit.

- Comitar um arquivo específico:

```shell
    git commit nome_do_arquivo.txt -m "Mensagem do commit"
```

- Comitar todos os arquivos adicionados:

```shell
  git commit -m "Mensagem do commit"
```

### 4.1 Editando a Mensagem do Commit

Caso seja necessário alterar a mensagem do commit mais recente, utilize:

```shell
  git commit --amend
```
> Atenção: Alterar a mensagem de um commit gera um novo commit com um hash diferente. Evite alterar commits que já foram enviados ao repositório remoto.

Para mais detalhes, consulte o Guia do [Github](https://docs.github.com/pt/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/changing-a-commit-message)

## 5. Visualizando Alterações

### 5.1 git log

Exibe o histórico de commits:
```shell
git log
```

Exemplo de saída:
```shell
commit 2a3f2b6245**********
Author: Breno Vambáster
Date:   Tue Jul 20 09:49:58 2021 -0300

    Update README.md
```

Para uma visualização gráfica e resumida:
```shell
  git log --graph --oneline --all
```

### 5.2 git show
Exibe detalhes de um commit específico, incluindo as alterações realizadas:
```shell
  git show 2a3f2b6245
```

### 5.3 git diff
Mostra as diferenças entre o estado atual dos arquivos e o último commit (ou entre commits/branches):
```shell
  git diff
```


### 5.4 git remote
Lista os repositórios remotos configurados:
```shell
git remote
```

## 7. Restaurando Alterações com git restore

O comando git restore é uma ferramenta moderna para desfazer alterações, complementando (e, em alguns casos, substituindo) o uso do git checkout para restaurar arquivos.

### 7.1 Restaurar um Arquivo do Working Directory
Se você alterou um arquivo e deseja descartá-lo, retornando à última versão commitada:
```shell
 git restore nome_do_arquivo.txt
```

## 7.2 Restaurar um Arquivo no Index
Caso já tenha adicionado um arquivo ao staging area e queira removê-lo:

```shell
$ git restore --staged nome_do_arquivo.txt
```
> Observação:
O git restore ajuda a manter as ações do Git mais intuitivas, separando a restauração de arquivos do ato de trocar de branch, que é feito com git checkout.



## 6. Revertendo Alterações com Checkout
Outra forma de descartar alterações (especialmente em arquivos individuais) é usando o comando git checkout:

```shell
 git checkout -- nome_do_arquivo.txt

```

> Nota: O comando checkout também é utilizado para alternar entre branches. Com o git restore, o Git busca tornar as ações mais claras e específicas.


## 7. Desfazendo Commits com Reset
Utilize git reset para desfazer commits, com duas abordagens principais:

- Modo soft: Remove o commit, mantendo as alterações no Index.

```shell
 git reset HEAD~1
```

- Modo hard: Remove o commit e descarta as alterações no Working Directory.

```shell
 git reset --hard HEAD~1
```

Cuidado: O uso de --hard elimina permanentemente as modificações não commitadas.

## 8 Mesclando Alterações com Merge

O merge integra alterações de diferentes branches.

1. Crie e mude para uma nova branch (exemplo: feature):
```shell
$ git checkout -b feature
```

2. Realize os commits na branch feature.
3. Retorne à branch principal (geralmente main ou master):

```shell
$ git checkout main
```

4. Mescle a branch feature na branch main:

```shell
$ git merge feature
```

Se houver conflitos, o Git indicará os arquivos afetados para que você os resolva manualmente. Após resolver os conflitos, finalize o merge:
```shell
$ git add arquivos_resolvidos
$ git commit -m "Resolvendo conflitos e finalizando merge"
```


## 9 Chave SSH: O que é e como Gerar?

De maneira simplificada uma chave SSH é uma maneira de assegurar a segurança entre a conexao entre sua máquina e o repositório do GitHub  <br>

* Para verificar se já possui uma chave SSH registrada ou caso queira adicionar uma nova basta ir no seu perfil do github e acessar settings>SSH and GPG keys. <br>

Vamos explicar passo a passo como criar uma nova chave SSH: <br> <br>

### 9.1 - Inicialmente vamos gerar uma nova chave (Será necessário utilizar o email o qual está vinculado ao GitHub para gerar a chave)

```shell
  $  ssh-keygen -t ed25519 -C seuemail@mail.com
```

Após ser a execução do comando, perguntará qual local a chave será armazenada, para selecionar o local padrão bastar apertar Enter (Recomendado utilizar padrão) <br>

Logo após aparecerá um campo para criar uma senha ou continuar sem uma senha (Altamente recomendado criar uma senha) <br>
Ao final será gerado duas chaves, uma publica e outra privada e será exibido o Local onde foram salvas (Importate) <br>
  
### 9.2 - Adicionando Chave SSH ao GitHub

Logo após iremos acessar o local onde foi salvo as chaves através do comando: <br> <br>

```shell 
  $  cd "CaminhoAteDiretorio"
  ex: $ cd "C:\Users\usuario/.ssh/"
```
  
Entao iremos acessar o arquivo que contem a chave publica através do comando: <br> <br>
  
```shell 
  $  cat id_ed25519.pub 
```

Irá aparecer a chave gerada, você deverá copiá-la e vincula-la a suas chaves através do seu Perfil no GitHub > settings > SSH and GPG keys > new SSH Key <br>
O Titulo fica a seu critério Ok? ;)

Logo após sera exigido sua senha do GitHub para validação. <br>

### 9.3 - Validando chave SSH

Para que sua chave funcione corretamente será necessário que seu computador saiba o que fazer com ela, portanto vamos seguir os seguintes passos:

```shell 
$ eval $(ssh-agent -s)
```
Ao utilizar esse comando voce esta indicando para o computador iniciar o projeto e executar esse processo em segundo plano. <br>

Logo após sera exibida uma mensagem semelhante a essa "Agent pid 300" (Número gerado aleatoriamente), então digite os seguinte comando, no qual direcionara para o acesso a sua chave privada: <br> <br>
  
```shell 
$  ssh-add "caminhoAteChave"
ex: $  ssh-add "C:\Users\usuario/.ssh/id_ed25519"
```


Logo após sera exigido que digite a senha a qual foi criada a chave. <br>
Prontinho sua chave foi gerada com sucesso,ativada e vinculada a sua conta, mas Lembre-se *NUNCA DIVULGUE SUA CHAVE PRIVADA*!!! <br>
Sempre que você quiser acessar um servidor remoto, basta copiar ou pedir que o administrador copie sua chave pública para ele. <br>

### Caso tenha algum problema...

> Acesse o link do artigo  do GitHub, lá está bem explicado e com passo a passo. [Artigo github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)


## 12. Trabalhando com Branches

Branches permitem desenvolver funcionalidades ou corrigir bugs de forma isolada.

### 12.1 Listando Branches

Veja todas as branches locais:

```shell
$ git branch
```

### 12.2 Criando uma Nova Branch

Crie uma nova branch sem sair da branch atual:

```shell
$ git branch nome-da-branch
```

Ou crie e alterne imediatamente:

```shell
$ git checkout -b nome-da-branch
```

### 12.3 Trocando de Branch

Mude para outra branch:

```shell
$ git checkout nome-da-branch
```

### 12.4 Renomeando uma Branch

Renomeie a branch atual:

```shell
$ git branch -m novo-nome-da-branch
```

### 12.5 Excluindo uma Branch

Após finalizar o trabalho e fazer o merge, remova a branch:

```shell
$ git branch -d nome-da-branch
```

Para forçar a exclusão (se não estiver mergeada):

```shell
$ git branch -D nome-da-branch
```

### Boas Práticas:

- Utilize branches para isolar funcionalidades ou correções.
- Mantenha a branch principal (main ou master) estável.
- Nomeie as branches de forma descritiva (ex.: feature/login, bugfix/header).

## 13. Repositórios Remotos

Repositórios remotos permitem sincronizar seu trabalho com servidores, como o GitHub.

### 13.1 Clonando um Repositório

Clone um repositório remoto para sua máquina:

```shell
$ git clone https://github.com/usuario/nome-do-repositorio.git
```

Ou utilizando SSH:

```shell
$ git clone git@github.com:usuario/nome-do-repositorio.git
```

### 13.2 Adicionando um Repositório Remoto

Se você já possui um repositório local e deseja associá-lo a um repositório remoto:

```shell
$ git remote add origin https://github.com/usuario/nome-do-repositorio.git
```

Verifique os repositórios remotos:

```shell
$ git remote -v
```

### 13.3 Enviando Alterações para o Remoto (Push)

Após os commits, envie as alterações para o repositório remoto:

```shell
$ git push origin main
```

Para uma nova branch:

```shell
$ git push -u origin nome-da-branch
```

### 13.4 Recebendo Alterações do Remoto (Pull)

Atualize seu repositório local com as alterações do remoto:

```shell
$ git pull origin main
```

### 13.5 Buscando Alterações sem Fazer Merge (Fetch)

Busque as alterações do repositório remoto sem mesclá-las imediatamente:

```shell
$ git fetch
```

Dica: Mantenha seu repositório atualizado para minimizar conflitos.
