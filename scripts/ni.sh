# Script que crea un grupo sin acceso a internet

no_internet_group=$(cat /etc/group | grep no-internet)
if [[ ! $no_internet_group == *"no-internet"* ]]; then
    # crea un grupo llamado no-internet, solo si no existe
    sudo -S groupadd no-internet

    # añadimos nuestro usuario en el grupo no-internet, 
    # esto es para poder usar este grupo en usuario
    sudo usermod -aG no-internet $USER
fi

# elimina las reglas directas, antes de agregar las nuestras
sudo rm '/etc/firewalld/direct.xml'

sudo systemctl restart firewalld
sudo firewall-cmd --reload

add_ipv4_rule()
{
    sudo firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 0 $@
}

add_rule()
{
    for ipv in ipv4 ipv6; do
        sudo firewall-cmd --permanent --direct --add-rule $ipv filter OUTPUT 0 $@
    done
}

# permite el acceso local en el grupo no-internet
add_rule -o lo -m owner --gid-owner no-internet -j ACCEPT

# permite el acceso al puerto 771 de la ip local de vmanager
add_ipv4_rule -p tcp -d "192.168.100.10" --dport 771 -j ACCEPT

# bloquea el acceso a internet en el grupo no-internet
add_rule -m owner --gid-owner no-internet -j DROP

sudo systemctl restart firewalld
sudo firewall-cmd --reload

# ejecuta una app en el grupo no-internet, ya que en ese grupo tiene
# reglas de iptable que bloquean el internet, la app queda sin internet
sg no-internet "ping -c 1 google.cl"

