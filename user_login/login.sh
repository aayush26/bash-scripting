name=`zenity --entry --title "username" --text "Enter username" --entry-text "username" --height=100 --width=250`
pass=`zenity --entry --title "password" --text "Enter password" --hide-text --height=100`
tmp=`mysql -u root -padmin123 userlist << EOF
select * from signup where username="$name" and pass="$pass";
EOF`
chk1=`echo $tmp|cut -c 30-35`
chk2=`echo $tmp|cut -c 37-42`
if [ "$chk1" == "$name" -a "$chk2" == "$pass" ]
then
zenity --info --title "Login" --text "Login successful"
exit
else
zenity --error --title "Login" --text "Login failed"
exit
fi
