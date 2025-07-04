#!/bin/bash

تحديث النظام وتثبيت الأدوات المطلوبة

sudo pacman -Sy --noconfirm figlet lolcat dialog zenity ttf-font-awesome

إنشاء ملف الواجهة الرسومية

mkdir -p ~/.config/darkweb-login cat << 'EOF' > ~/.config/darkweb-login/login.sh #!/bin/bash

تغيير الألوان تلقائيًا بين البنفسجي والرمادي

function animate_border() { local colors=("\e[35m" "\e[90m") for ((i = 0; i < 20; i++)); do clear color=${colors[$((i % 2))]} echo -e "${color}" echo "" echo "   ╭────────────────────────────────────────╮" echo "   │                                        │" echo "   │     WELCOME TO DARKWEB LOGIN SYSTEM    │" echo "   │                                        │" echo "   ╰────────────────────────────────────────╯" echo "" echo "" figlet -f small "anonymous" | lolcat echo -e "\e[0m" sleep 0.2 done }

animate_border

إدخال اسم المستخدم وكلمة المرور

USER=$(zenity --entry --title="Login" --text="Enter your username") PASS=$(zenity --password --title="Authentication")

تحقق وهمي (يمكنك ربطه بمستخدم حقيقي لاحقًا)

if [[ "$USER" == "root" && "$PASS" == "toor" ]]; then zenity --info --text="Login successful. Welcome $USER!" exec zsh || exec bash else zenity --error --text="Login failed." exit 1 fi EOF

chmod +x ~/.config/darkweb-login/login.sh

جعل الواجهة تعمل تلقائيًا عند تشغيل الجهاز (فقط للواجهة الطرفية)

echo "exec ~/.config/darkweb-login/login.sh" > ~/.bash_profile

clear figlet -f slant "READY" | lolcat echo "تم تثبيت واجهة تسجيل الدخول الأسطورية!" echo "للتجربة الآن، اكتب: ~/.config/darkweb-login/login.sh"

