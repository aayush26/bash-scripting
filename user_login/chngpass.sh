name=`zenity --entry --title "Change password" --text "Enter username: "`
pass=`zenity --entry --title "Change password" --text "Enter password: " --hide-text`
tmp=`mysql -u root -padmin123 userlist << EOF
select * from signup where username="$name" and pass="$pass";
EOF`
chk1=`echo $tmp|cut -c 30-35`
chk2=`echo $tmp|cut -c 37-42`
if [ "$chk1" == "$name" -a "$chk2" == "$pass" ]
then
newpass=`zenity --entry --title "Change password" --text "Enter new password: " --hide-text`
mysql -u root -padmin123 userlist << EOF
update signup set pass="$newpass" where username="$name" and pass="$pass";
EOF
zenity --info --title "Change password" --text "Password changed"
exit
else 
zenity --error --title "Error" --text "Incorrect username or password"
exit
fi
