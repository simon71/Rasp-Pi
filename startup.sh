#! /bin/bash

#sudo apt-get -y update
#sleep 1
#echo -ne "######\r"
#sleep 1
#echo -ne "##########\r"
#sleep 1
#echo -ne "#############\r"
#sleep 1
#echo -ne "Now updating     \r"
#sleep 2
#sudo apt-get -y update
#sleep 2
#echo "Update complete"
#echo ""
#sleep 2
#echo "Now cleaning system"
#echo ""
#sleep 2
#sudo apt-get clean
#sleep 2
#echo "Clean up complete"
#echo ""
#sleep 2

#clear

# set user
usr="$USER"

#create log dir if not present
if [ ! -f $log ];then
    sudo mkdir /home/$usr/log
    sudo chown -R $usr:$usr /home/$usr/log
fi

#set location of packages file
file="/home/$usr/packages.txt"

# check that the packages file isnt empty
if [ -s $file ];then

    exec 4<$file

    while read -u4 p ; do

            pkg=$p

            # check to see if package is already installed
            pkg_check(){ dpkg-query -W -f='${Status}\n' $pkg }

            # run package install
            pkg_install(){ sudo apt-get -y install $pkg }

            # search cache for package
            pkg_search(){ sudo apt-cache search $pkg }

            # log file for install output
            log="/home/$usr/log/start_up_log.txt"


            # sucessful output message
            ms1="install ok installed"
            # no package found message
            ms2="no packages found matching $pkg"

            #echo messages
            em="sudo apt-cache search $pkg"
            em1="$pkg failed to install./nPlease check the spelling in $file/n or run $em to search for the package "
            em2="$pkg is already installed."
            em3="$pkg installed sucessfully"
            em4="There is no package named $pkg./nPlease check the spelling in $file."
            em5="$pkg was not installed sucessfully./n This is due to a problem with the package name./n Please check $file for a list of avaiable packages that match that name."

            ##RUN##

            # first check to see if the package is already installed
            pkg_status=$(pkg_check $pkg)

            #if already installed
            if [ "$pkg_status" == "$ms1" ]; then
                echo "$em2" | tee $log
            else
                eval $pkg_install # run apt-get install

                # once run check to see if install was sucessful
                p_s=$(pkg_check $pkg)

                # if sucessfull
                if [ "$p_s" == "$ms1" ]; then
                    echo "$em3" | tee $log
                else #search the cache for the package name
                    pk_s=$(pkg_search $pkg)
                    if [ "$pk_s" == "" ]; then
                        echo "$em4" | tee $log
                    else
                        echo "$em5" | tee $log
                    fi
                fi
            fi


    done<$file
    echo "install complete"
    exit
# if packages file is empty
else
    echo "$file is empty./n Please go to $file and add packages to be installed."
fi
