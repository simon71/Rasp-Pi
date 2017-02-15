#! /bin/bash

sudo apt-get -y update
sleep 2
echo ""
echo ""
echo "Now updating"
echo ""
sleep 2
sudo apt-get -y update
sleep 2
echo ""
echo ""
echo "Update complete"
echo ""
echo ""
sleep 2
echo "Now cleaning system"
echo ""
echo ""
sleep 2
sudo apt-get clean
sleep 2
echo ""
echo "Clean up complete"
echo ""
sleep 2
clear

#create log dir if not present
if [ ! -f $log ];then
    sudo mkdir /home/$usr/log
    sudo chown -R $usr:$usr /home/$usr/log
fi

# randomly generate password
passwd=< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-12}

# echo passwd to terminal to be copied by uer
echo $password

pwm="Press space bar once you've copied the password.
If you cant copy and paste the password simply take a screen grab.
Once you continue you wont be able to see this password again."

# user copy passord then press space bar to continue
read -n1 -r -p "$pwm"

# update the pi user password and then clear the screen
if [ "$key" = '' ]; then
    echo "pi:$passwd"|chpasswd
    echo "password updated"
    sleep2
    clear
fi

#check ssh
echo "testing to see if ssh is enabled and running"
sleep 2
echo ""

# ssh test
ssh_test(){
    sudo /etc/init.d/ssh status | grep running
}

#sshinstall
ssh_install(){
    sudo apt-get install -y ssh openssh-server
    sudo etc/init.d/ssh start
}

ssh=$(ssh_test running)
sshm="ssh is inastalled and running."

if [ "$ssh" != "" ]; then 
    echo "$sshm" | tee $log
    $ssh >> $log
else
    eval $ssh_install
    eval 
    if  ["$ssh" != "" ]; then
        echo "$shsm" | tee $log
        $ssh >> $log
    else
        echo "ssh has failed to install" | tee $log
    fi
fi

# set user
usr="$USER"


#set location of packages file
file="/home/$usr/packages.txt"

# check that the packages file isnt empty
if [ -s $file ];then

    exec 4<$file

    while read -u4 p ; do

        pkg=$p
        # check to see if package is already installed

        # run package install
        pkg_install(){
            sudo apt-get -y install $pkg
        }

        # search cache for package
        pkg_search(){
            sudo apt-cache search $pkg
        }

        # log file for install output
        log="/home/$usr/log/start_up_log.txt"

        # sucessful output message
        ms1="install ok installed"
        # no package found message
        ms2="no packages found matching $pkg"

        # echo messages
        emb=""
        em="sudo apt-cache search $pkg"
        em1="$pkg failed to install."
        em1a="  Please check the spelling in $file"
        em1b="  or run $em to search for the package "
        em2="$pkg is already installed."
        em3="$pkg installed sucessfully"
        em4="There is no package named $pkg."
        em4a="  Please check the spelling in $file."
        em5="$pkg was not installed sucessfully."
        em5a="  This is due to a problem with the package name."
        em5b="  Please check $file for a list of avaiable packages that match that name."

        ##RUN##

        # first check to see if the package is already installed 

        pkg_check(){
            {
                dpkg-query -W -f='${Status}\n' $pkg
            } &> /dev/null
        }

        {
        pkg_status=$(pkg_check $pkg)
        } &> /dev/null
            #if already installed
            if [ "$pkg_status" == "$ms1" ]; then
                echo "$em2" | tee $log
                echo "$emb" | tee $log
            else
                eval $pkg_install # run apt-get install

                # once run check to see if install was sucessful
                p_s=$(pkg_check $pkg)

                # if sucessfull
                if [ "$p_s" == "$ms1" ]; then
                    echo "$em3" | tee $log
                    echo "$emb" | tee $log
               else #search the cache for the package name
                    pk_s=$(pkg_search $pkg)
                    if [ "$pk_s" == "" ]; then
                        echo "$em4" | tee $log
                        echo "$em4a" | tee $log
                        echo "$emb" | tee $log
                    else
                        echo "$em5" | tee $log
                        echo "$em5a" | tee $log
                        echo "$em5b" | tee $log
                        echo "$emb" | tee $log
                    fi
                fi
            fi

    done
    echo 'install complete'
# if packages file is empty
else
    echo "$file is empty.\n Please go to $file and add packages to be installed."
fi

# check if LXDE autostart has inatlled
as=/etc/xdg/lxsession/LXDE/autostart

if [ -e $as ]; then
    echo @xset s off >> $as
    echo @xset -dpms >> $as
    echo @xset s noblank >> $as
    echo @sh /home/$USER/start.sh
else
    echo "lxsession hasn't installed properly. So the autostart file cant be updated"
fi

