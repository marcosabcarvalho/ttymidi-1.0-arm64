# ttymidi-1.0-arm64
ttymidi allows external serial devices to interface with the ALSA sequencer.
OragePi LTS4 Linux Ubuntu
Install:
sudo dpkg -i ttymidi-1.0-arm64.deb


Para criar o pacote:
1- Instale as ferramentas de desenvolvimento:
sudo apt install libasound2-dev debian-essentials
2- Dentro da pasta src, edite ttymidi.c e altere a primeira linha do "Main program" deve estar escrito assim: 
int main(int argc, char** argv)
3- Na pasta onde está o arquivo Makefile execute:
make clean
make
4- Para criar o pacote deb:
Edite Makefile se precisar mudar a arquitetura ou versões dos prerequisitos, então execute:
make package
Nesse momento o arquivo ttymidi-1.0-arm64.deb será criado.
5- Para instalar o pacote criado, execute:
sudo dpkg -i ttymidi-1.0-arm64.deb
