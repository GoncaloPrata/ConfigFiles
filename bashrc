#####
##### FICHEIRO BASHRC CRIADO POR GONCALO PRATA
#####

###
### Coisas relacionadas com o prompt (PS1) : https://bash-prompt-generator.org/
###

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null || echo "(not in a repo)")'
 
PS1='\[\e[38;5;202;1m\]Git Branch : \[\e[0m\]${PS1_CMD1} | \[\e[38;5;160;1m\]Data : \[\e[0m\]\D{%Y-%m-%d} \A | \[\e[38;5;76;1m\]Diretorio : \[\e[0m\]\w \$ '

###
### Diferentes variaveis globais
###

HISTTIMEFORMAT="%y-%m-%d %T "

###
### Diferentes alias
###

# Alias comando 'ls' e 'find'

alias ls='ls --color=auto'
alias la='ls --all --color=auto'
alias lsdir='ls -d */'
alias lsfile='find . -maxdepth 1 -type f -exec ls --color=auto {} \;' # Encontra todos os ficheiros no diretorio corrente e faz ls

alias ll='ls -l --color=auto --time-style=long-iso --human-readable -o'
alias lla='ls -l --all --color=auto --time-style=long-iso --human-readable -o'
alias lldir='ll -d */'
alias llfile='find . -maxdepth 1 -type f -exec ls -l --color=auto --time-style=long-iso --human-readable -o {} \;' # Encontra todos os ficheiros no diretorio corrente e faz ll


# Alias comando 'clear'

alias cls='clear'

# Alias editar e reload a ficheiros especificos 

alias load_bashrc='source ~/.bashrc'
alias edit_bashrc='vi ~/.bashrc'
alias edit_vimrc='vi ~/.vimrc'

# Alias comando 'mkdir'

alias mk='mkdir'

# Alias relacionados com Python

alias python='python3'

# Alias comando 'history'

alias hist='history | sort -rn | less'

# Alias comand 'grep' TODO

alias grep='grep --extended-regexp --color=auto'

###
### FUNCOES
###

function mkcd() { # Cria um diretorio e entra dentro do mesmo
	if [ "$#" -ne 1 ]; then
		echo "Numero de argumentos invalido. Comando : 'mkcd <diretorio_a_criar>'."
		return
	fi

	mkdir $1 && cd $1
}

function prev() { # Vai 'n' diretorios para tras sendo 'n' o valor passado em argumento
	if [ "$#" -ne 1 ]; then
		echo "Numero de argumentos invalid. Comando : 'prev <numero_de_diretorios_a_retroceder'"
		return
	fi

	num_prev=1

	while [ $num_prev -le $1 ]	
	do
		cd ..
		num_prev=`expr $num_prev + 1`	
	done
}
