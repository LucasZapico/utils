# macos-env-starter-script

## About 

A starter script that "all in one" installs and configure common programs such as Brew, Vscode, python, Node, etc. The goal of this script is to automate the enviroment setup when spinning up work enviroment on fresh macos install. 


## Stack
<img src="https://skillicons.dev/icons?i=bash&perline=10" />

### TL:DR

**Why I started this project**

Over the years I have had to set up my development(work) enviroment on many computers and by the thrid time I knew I needed to automate as much of the process as I could. Thus `macos-env-starter-script` was born. As of 2022 the script is on iteration v1.5 and has finally made it's way from personal gist to repo. 

At some point I would like to have a curl install like brew that just handles everything. But we'll see. 

### Some of what it does 

**Installs**
- brew
- oh-my-zsh 
- configures global github
- node
- python 
- vscode
- google chrome 
- dbngin 

## Feature Catch 

Catch for ideas for enhancement that are not slated features yet. 

### Ideas
- [ ] ?? vscode extensions ??

#### Features
- [x] add prompt to install all or prompt to install casks and packages 
- [ ] enhance error handling 

## Gotcha

### DBngin 

```sh 
# dbngin access bug fix
export PATH=/Users/Shared/DBngin/mysql/8.0.12/bin:$PATH
sudo chmod -R 777 /Users/Shared/DBngin/ 
```
### App from unverified developers

```sh 
sudo spctl --master-disable
```

## Reference 

[I. U. mac env set up shell](https://github.com/lk-geimfari/macbook/blob/master/install.sh)
