while :
do
clear
echo "-------------------------------------------------------------"
echo -e "\t\tWelcome to Utility-Panel"
echo "-------------------------------------------------------------"
echo  "Services provided:
	[1] To see date and time
	[2] To check calendar of your month and year choice
	[3] To start vi editor
	[4] To see any file
	[5] To print multiplication table of a given number
	[6] For appointment scheduling
	[7] To see your appointments
	[8] Exit"
echo "-------------------------------------------------------------"
echo -n "Enter a service: "
read op
case $op in
	1) sh dt.sh;;
	2) sh cal.sh;;
	3) vi;;
	4) sh file.sh;;
	5) sh tables.sh;;
	6) sh schduleapp.sh;;
	7) clear
	   cat final;;
	8) exit;;
	*) echo "Invalid input"
esac
echo "Enter to continue.. ctrl + c to exit now" 
read
done
