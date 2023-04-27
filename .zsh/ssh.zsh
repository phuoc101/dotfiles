if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/id_rsa_github
  ssh-add ~/.ssh/id_rsa_gitlab
fi

if [ $(which_term) == "kitty" ] 
then
  alias ssh="kitty +kitten ssh"
fi

export HOLYBRO="bot@192.168.50.194"
export NX1="bot@192.168.50.166"
