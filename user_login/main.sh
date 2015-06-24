zenity --info --title "Linux User Management Panel" --text "Welcome to Linux!"
opt=`zenity --list --title "Linux" --text "Please select an option" --radiolist --column "Select" --column "Option" false "Sign Up" false "Login" false "Change password" false "Forget password" false "Exit" --height=270 --width=250`
case $opt in
	"Sign Up") sh signup.sh;;
	"Login") sh login.sh;;
	"Change password") sh chngpass.sh;;
	"Forget password") sh frgtpass.sh;;
	"Exit") exit;;
esac
