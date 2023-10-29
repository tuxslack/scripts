#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 04:41
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
# Sistema ultilizado: Void Linux
#
# Usabilidade: qualquer distribuição linux.
#
# Uso: adicionar permissão de execução (chmod +x) ao arquivo como root (Ex.: # chmod +x firewall-void.sh). Mover o arquivo para o diretório /etc/rc.d/ para o 
# Slackware e distribuições derivadas, para outra distribuições mover para o local adequado (Ex.: /etc/init.d/).



# Firewall simples para ambientes desktop Linux.

# Para testar seu Firewall (verifica 1055 portas) => https://www.grc.com/intro.htm


# Muita atenção
#
# Antes de aplicar estas configurações, analise todo o seu ambiente a fim de evitar problemas ainda maiores com bloqueios de seus serviços.
#
# Como boa prática, após conter o surto de ataques (DDoS), faça uma auditoria em seu servidor Linux e remova tudo que não for estritamente 
# necessário. Mantenha seu servidor atualizado e também nunca se esqueça de utilizar um sistema de logs.




# Teste as regras de firewall (Linux)
#
#
# Para testar os conjuntos de regras TCP de um firewall remoto. Se você quer algo mais avançado, 
# pode usar um criador de pacotes como hping que é projetado para testar conjuntos de regras de 
# firewall. Aqui estão algumas informações sobre como construir pacotes com hping. 
 #
 #
# $ nmap -p 0-65535 -PN localhost
# Starting Nmap 7.80 ( https://nmap.org ) at 2023-03-25 13:51 -03
# Nmap scan report for localhost (127.0.0.1)
# Host is up (0.00014s latency).
# Other addresses for localhost (not scanned): ::1
# rDNS record for 127.0.0.1: localhost.localdomain
# Not shown: 65533 closed ports
# PORT     STATE SERVICE
# 80/tcp   open  http
# 631/tcp  open  ipp
# 3306/tcp open  mysql
#
# Nmap done: 1 IP address (1 host up) scanned in 2.71 seconds





# Site para você testar o seu firewall:
#
# http://www.grc.com/
#
# Clique lá em cima em Services > ShieldsUP, depois clique em Proceed, depois clique em "All Service Ports", se aparecer a 
# palavra FAILED lá em baixo da página, significa que seu Firewall está inseguro
#
# No meu caso o Firewall ficou FAILED em "Ping Reply"
#
# Ou seja meu Firewall está inseguro em relação ao Ping(icmp echo).
#
# O status => Vermelho (Aberto), Azul Escuro (Fechado) ou Verde (Invisível).
#
# O ideal é tudo em verde.



# https://www.vivaolinux.com.br/script/Firewall-Iptables-Desktop
# https://www.routech.ro/pt-br/como-proteger-seu-desktop-linux-com-iptables/
# https://www.guiafoca.org/guiaonline/seguranca/ch05s06.html
# https://www.vivaolinux.com.br/dica/Testando-seu-firewall-com-scan-remoto-via-internet
# https://www.vivaolinux.com.br/topico/netfilter-iptables/Iptables-bloqueia-realmente-Synflood
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=7070



# Não altere as linhas abaixo

VERMELHO='\033[1;31m'
VERDE='\033[1;32m'
AZUL='\033[1;36m'
AMARELO='\033[1;33m'
ROSA='\033[1;35m'
NC='\033[0m'


# Portas:

# qbittorrent

porta_do_torrent="30899"

# cups - Impressora

porta_do_cups="631"

# mysql

porta_do_mysql="3306"



clear



# Firewall Start

function startFirewall(){

echo -e "[${ROSA} Carregando politica padrao... ${NC}]"

iptables -P INPUT ACCEPT
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

echo "Politica Default das Cadeias ........................[ OK ]"


# Em um desktop, eh comum usarmos KDE ou GNOME, cujos processos se comunicam via interface loopback (lo, 127.0.0.1), alem de outros daemons do linux que tambem a utilizam.

# iptables -A INPUT -i ! lo -j LOG --log-prefix "BLOQUEIO "

# Depois de por no ar, fica fazendo um:
#
# tail -f /var/log/messages |greo BLOQUEIO

#  ver o que foi bloqueado.


# interface loopback

iptables -A INPUT -i lo -j ACCEPT

echo "Interface loopback ........................[ OK ]"



# Internet

iptables -A INPUT    -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
 
iptables -A INPUT     -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT


echo "Liberadas portas para o  acesso a  internet........................[ OK ]"



# qbittorrent

# ATENCAO: em caso de torrent, lembrar de liberar as portas do mesmo:

iptables -A INPUT -p tcp --dport $porta_do_torrent -j ACCEPT

echo "Liberada porta para o  qbittorrent ........................[ OK ]"



# Abre as portas DNS

# Pesquisas de DNS (Sistema de nome de domínio ou Domain Name System)  e registro de serviços.


iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT

iptables -A OUTPUT  -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

echo "Liberada porta para o  DNS ........................[ OK ]"


# cups

iptables -A INPUT -p tcp --dport $porta_do_cups -j ACCEPT

echo "Liberada porta para o  cups ........................[ OK ]"


# mysql

iptables -A INPUT -p tcp --dport $porta_do_mysql -j ACCEPT

echo "Liberada porta para o  mysql ........................[ OK ]"


# E-mail (acho que usa a interface loopback na maquina local)

# Pop 995

# smtp 465, 587




# Portas a Serem Liberadas se o Compartilhamento é via Samba(SMB)


# Serviço de nome de internet (pesquisa de nomes para impressora SMB).

# iptables -A INPUT    -p udp --dport 137 -j ACCEPT

# iptables -A OUTPUT -p udp --dport 137 -j ACCEPT


# Impressão SMB do Windows

# iptables -A INPUT -p tcp --dport 139 -j ACCEPT



# Servidor de domínio do Windows (Autenticação SMB de impressora).

# iptables -A INPUT    -p tcp --dport 445 -j ACCEPT

# iptables -A OUTPUT -p tcp --dport 445 -j ACCEPT


# https://www.gnulinuxbrasil.com.br/?p=4551


# echo "Liberadas as portas para o servidor Samba (SMB) ........................[ OK ]"



# Garante que o Firewall permitira pacotes de conexões ja iniciadas

# iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# ------------------------------------------------------------------------------------------------------------------------------------------------

# Proteção:


# Contra-medidas para ataques DDoS e Smurf
#
# Ataques DDoS ( Distributed Denial of Service ), consistem em "inundar" a rede da vítima com uma grande quantidade 
# de pacotes e indisponibilizar todo o link dependendo da frequência do ataque.
#
# Como o nome mesmo sugere é um ataque distribuido de negação de serviço no qual diversas máquinas/hosts irão 
# multiplicar seu tráfego contra a vítima, no qual o sucesso do ataque se dá pelo número de atacantes contra um só ip. 
#
# Ataques Smurf
#
# Ataques Smurf é originado pela falha do IPV4 ( Spoofing ), no qual envia pacotes ICMP type 8 (ICMP_ECHO_REQUEST), 
# com o endereço de origem "spoofado", com isso o atacante envia uma quantidade consideravél de pacotes para uma 
# lista de ip's, esses servidores irão responder para o endereço de origem informado no pacote, caso todos os ip's 
# responderem para o mesmo endereço o alvo será inundado. 
#
# Contra medida contra o ataques Smurf
#
# Uma contra medida para o Smurf é negar pacotes do tipo 8 do ICMP



# Ignora pings

iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

echo "Ignora pings....[ OK ]"

# Protege contra IP spoofing
#
# No Void Linux esta como 0
#
# echo "1" > /proc/sys/net/ipv4/conf/default/rp_filter


# Utilizado em diversos ataques, isso possibilita que o atacante determine o "caminho" que seu
# pacote vai percorrer (roteadores) ate seu destino. Junto com spoof, isso se torna muito perigoso.

echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route

echo "Impossibilita que o atacante determine o caminho ....[ OK ]"


# Protecao contra responses bogus

echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

echo "Protecao contra responses bogus .....................[ OK ]"


# Protecao contra ataques de syn flood (inicio da conexao TCP). Tenta conter ataques de DoS.
#
# iptables bloqueia realmente um ataque Syn flood.
#
# Isso ameniza o ataque.


# Ativar SYN cookies

echo "1" > /proc/sys/net/ipv4/tcp_syncookies

echo "Protecao contra ataques de syn ......................[ OK ]"





# Contra medida contra o ataques Smurf
#
# No Void Linux esta como 0
#
# Configurando a Protecao anti-spoofing
#
# echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter

#for spoofing in /proc/sys/net/ipv4/conf/*/rp_filter; do
#        echo "1" > $spoofing
#done
# echo "Protecao anti-spoofing ..............................[ OK ]"



# ------------------------------------------------------------------------------------------------------------------------------------------------
 


# Descarta pacotes mal formados protegendo contra ataques diversos

iptables -A INPUT -m state --state INVALID -j DROP


echo "Descarta pacotes mal formados protegendo contra ataques diversos ..............................[ OK ]"




# bloqueia as portas UDP de 0 a 1023 (com exceção das abertas acima)

iptables -A INPUT -p udp --dport 0:1023 -j DROP

echo "Bloqueia as portas UDP de 0 a 1023 (com exceção das abertas acima) ..............................[ OK ]"


# E finalmete, bloqueando tudo que nao foi permitido nas regras acima

# bloqueia conexões nas demais portas

iptables -A INPUT -p tcp --syn -j DROP

echo "Bloqueando tudo que nao foi permitido nas regras acima ......................[ OK ]"


echo "
Regras do firewall ativadas
"


}




# Firewall Stop 

function stopFirewall(){


# Limpando as regras

echo -e "[${ROSA} Zerando tabelas ${NC}]"


# Caso haja alguma configuracao residual, esta sera apagada.

iptables -F
iptables -X
iptables -Z

iptables -t nat -F



    # Definindo a Politica Default das Cadeias
    
    iptables -P INPUT ACCEPT
    
    # Se o desktop não esta em rede local
    
    iptables -P FORWARD DROP
    
    
    iptables -P OUTPUT ACCEPT
    
echo "Politica Default das Cadeias ........................[ OK ]"



# Desabilitar o trafego IP entre as placas de rede

echo "0" > /proc/sys/net/ipv4/ip_forward

echo "Desabilitar o trafego IP entre as placas ............[ OK ]"




    # interface loopback
    
    iptables -A INPUT -i lo -j ACCEPT


echo "
Regras do firewall desativadas
"

   
}


# ====================================================

case "$1" in
    start )
        startFirewall
        echo; echo -e "[${VERDE} Firewall carregado ${NC}]"; 
        echo "Use: firewall-void.sh  status para verificar as regras"

        ;;
 
    stop )
        stopFirewall
        echo; echo -e "[${VERDE} Regras de firewall removidas ${NC}]"; echo
        ;;
 
    restart )
    
        # Firewall Restart
        
        stopFirewall
        
        sleep 1
        
        startFirewall
        
        ;;
 
    status )
    
        echo -e "
[${VERDE} Regras IPv4 ${NC}]
        ";
        
        /sbin/iptables -nL
        
        echo -e "
[${VERDE} Regras IPv6 ${NC}]
        ";
        
        /sbin/ip6tables -nL
        ;;
 
    * )
        echo "Opção inválida, use firewall-void.sh start | stop | restart | status"
        # echo "Use os parametros start ou stop"
        
        ;;
esac



exit 0

