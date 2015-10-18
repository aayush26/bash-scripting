ad=y
while [ $ad == "y" ]
do 
clear
echo -n "Appointment Title: "
read title
echo -n "Date [DD/MM/YYYY]: "
read date
echo -n "Time [HH:MM AM/PM]: "
read time
echo -n "Any remarks: "
read remarks
echo -n "Is data entry OK [y/n]: "
read ok
if [ $ok == "y" ]
then
echo $title > title
echo $date > date
echo $time > time
echo $remarks > remarks
paste title /dev/null date /dev/null time /dev/null remarks >> final
echo -n "Add next appointment [y/n]: "
read ad
else
echo "Press enter to add again"
read
ad=y
fi
done
