name=`zenity --entry --title "username" --text "Enter username" --entry-text "username"`
seques=`zenity --entry --title "Security question" --text "select a security question" --entry-text "Who's your favourite teacher?" "What is your fav pet?" "Who is your fav footballer?" "What is the name of your hometown?" --width=400`
ans=`zenity --entry --title "Answer" --text "Answer: "`
tmp=`mysql -u root -padmin123 userlist << EOF
select * from signup where username="$name" and seques="$seques" and ans="$ans";
EOF`
echo $tmp
chk=`echo $tmp|cut -c 30-35`
echo $chk
if [ "$chk" == "$name" ]
then
pass=`echo $tmp|cut -c 37-42`
zenity --info --title "Password" --text-info "Your password: $pass"
fi
