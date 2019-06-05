sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# Python
# https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
export PATH=~/.local/bin:$PATH
source ~/.bash_profile

# AWS CLI
# https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html
pip3 install awscli --upgrade --user

# Nodejs
sudo apt-get install curl python-software-properties -y
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt-get install nodejs -y
## You may also need development tools to build native addons:
sudo apt-get install gcc g++ make -y
## To install the Yarn package manager, run:
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

# Docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt install docker-compose -y
sudo groupadd docker
sudo usermod -aG docker $USER

# Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# SAM
brew upgrade
brew update
brew tap aws/tap
brew install aws-sam-cli
