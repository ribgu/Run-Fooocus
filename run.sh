#!/bin/bash

# Função para imprimir mensagem verde
print_success() {
  echo -e "\e[32m$1\e[0m"
}

# Adicionar repositório gráfico da NVIDIA
sudo add-apt-repository ppa:graphics-drivers/ppa && print_success "Repositório gráfico da NVIDIA adicionado."

sudo apt update && print_success "Lista de pacotes atualizada."

# Instalar drivers NVIDIA
sudo apt install nvidia-driver-545 && print_success "Drivers NVIDIA-545 instalados."

# Atualizar o sistema
sudo apt update && sudo apt upgrade && print_success "Sistema atualizado."

# Instalar Conda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
echo 'export PATH="~/miniconda3/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc && print_success "Miniconda instalado e configurado."

# Inicializar Conda para bash e zsh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh && print_success "Conda inicializado para bash e zsh."

# Instalar e configurar RuinedFooocus
git clone https://github.com/runew0lf/RuinedFooocus.git
cd RuinedFooocus
conda env create -f environment.yaml
conda activate fooocus
pip install -r requirements_versions.txt
python launch.py --share && print_success "RuinedFooocus instalado e configurado."
