#!/data/data/com.termux/files/usr/bin/bash

banner() {
clear
echo -e "\e[1;31m"
echo "███████╗██╗░░██╗██████╗░██████╗░██████╗░░█████╗░██╗░░██╗██╗██╗░░██╗"
echo "██╔════╝██║░░██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░░██║██║╚██╗██╔╝"
echo "█████╗░░███████║██████╔╝██████╦╝██████╦╝██║░░██║███████║██║░╚███╔╝░"
echo "██╔══╝░░██╔══██║██╔═══╝░██╔══██╗██╔══██╗██║░░██║██╔══██║██║░██╔██╗░"
echo "██║░░░░░██║░░██║██║░░░░░██████╦╝██████╦╝╚█████╔╝██║░░██║██║██╔╝╚██╗"
echo "╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚═╝"
echo -e "\e[0m"
echo -e "\e[1;32m              by: Cyp3rox99 | Ethical OSINT Hunter 💀\e[0m\n"
}

install_dependencies() {
    pkg update -y && pkg upgrade -y
    pkg install python git curl wget -y
    pip install --upgrade pip

    pip install maigret holehe socialscan
    git clone https://github.com/sherlock-project/sherlock
    git clone https://github.com/thewhiteh4t/UserRecon
    git clone https://github.com/rajkumardusad/IP-Tracer
}

main_menu() {
    echo -e "\n\e[1;36m[1]\e[0m فحص اسم مستخدم (maigret + sherlock + userrecon)"
    echo -e "\e[1;36m[2]\e[0m فحص إيميل (holehe + socialscan)"
    echo -e "\e[1;36m[3]\e[0m تتبع عنوان IP (ip-tracer)"
    echo -e "\e[1;36m[4]\e[0m تحليل رقم هاتف (phoneinfoga)"
    echo -e "\e[1;36m[5]\e[0m خروج"
    echo -ne "\nاختيارك >> "; read choice

    case $choice in
        1) echo -ne "\nأدخل اسم المستخدم: "; read username
           python3 $(pwd)/sherlock/sherlock.py $username
           python3 $(pwd)/UserRecon/userrecon.sh $username
           maigret $username
           ;;
        2) echo -ne "\nأدخل الإيميل: "; read email
           holehe $email
           socialscan $email
           ;;
        3) bash $(pwd)/IP-Tracer/ip-tracer.sh ;;
        4) echo -ne "\nادخل رقم الهاتف (مع رمز الدولة): "; read phone
           termux-open-url "https://www.truecaller.com/search/int/$phone"
           ;;
        5) exit ;;
        *) echo "اختيار غير صحيح" ;;
    esac
}

# Start
banner
if [ ! -d "sherlock" ]; then
    echo -e "\n🔧 يتم التثبيت لأول مرة..."
    install_dependencies
fi
main_menu