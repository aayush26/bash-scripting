name=`zenity --entry --title "username" --text "Enter username[6 char must]" --entry-text "username" --height=100 --width=250`
notify-send $name
len=${#name}
if [ "$len" -gt 6 -o "$len" -lt 6 ]
then
zenity --error --title "username" --text "Invalid username"
exit
fi
tmp=`mysql -u root -padmin123 userlist << EOF
use userlist;
select * from signup where username="$name";
EOF`
chk=`echo $tmp|cut -c 30-35`
if [ "$name" == "$chk" ]
then
zenity --error --title "username" --text "Username already exists"
exit
fi
pass=`zenity --entry --title "password" --text "Enter password" --hide-text --height=100`
#notify-send $pass
dob=`zenity --calendar --title "DOB" --text "Enter your date of birth"`
#notify-send $dob
seques=`zenity --entry --title "Security question" --text "Select a security question" --entry-text "Who's your favorite teahcer?" "What is your fav pet?" "Who is your favorite footballer?" "What is the name of your hometown?" --width=400`
ans=`zenity --entry --title "Answer" --text "Answer: " --height=100 --width=250`
zenity --info --title "Completed" --text "You have successfully signed up"
mysql -u root -padmin123 userlist << EOF
insert into signup values ("$name","$pass","$dob","$seques","$ans");
EOF
