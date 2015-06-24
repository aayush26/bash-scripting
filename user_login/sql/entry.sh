read username
len=${#username}
echo $len
#read pass
paa=`mysql -u root -padmin123 << EOF
use userlist
select * from signup where username="$username";
EOF`
chk=`echo $paa|cut -c 30-31`
echo $chk
if [ "$username" == "$chk" ]
then
echo "Username already exists"
fi
