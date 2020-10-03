Open "Manual_Windows_Installation.exe" first.
## Manual Windows installation guide - By @AXON
##
###################################################################################################
###################################################################################################
# Make a Ext4 Partition
#######################
~Install "disk_genius.exe"
~Make a ext4 partition by resizing one of your existing ntfs partition [You will not lose your data]

###################################################################################################
###################################################################################################
# Ext4 Driver
#############
~Install "paragon_extfs_drivers.msi"

~Open "paragon_extfs_patch.exe"
~~~>Click on "Patch RSA 2048"
~~~>Go to "C:\Program Files (x86)\Paragon Software\ExtFS for Windows"
~~~>Select "extservice.exe"
~~
~~~>Again click on "Patch RSA 2048"
~~~>Go to "C:\Program Files (x86)\Paragon Software\ExtFS for Windows"
~~~>Select "Paragon ExtFS for Windows.exe"
~~~>Now click on "Generate" button.

###################################################################################################
###################################################################################################
# Bootloader & system files
###########################
~Open "grub2win\setup.bat" to dual-boot darkmatter with windows.

~Now copy "system.img" "dark.matter" "kernel" "initrd.img" "initrd-mod.img" "ramdisk.img" file to your new Ext4 partition.
~~>Rename "initrd.img" to "initrd-stock.img" in your ext4 partition.

###################################################################################################
###################################################################################################
# Using gearlock
################
~~ Reboot and boot into PhoenixOS DarkMatter

~~ After you see "Welcome to PhoenixOS" screen on the first boot,
~~~~> Press "Alt+F1" / "Alt+F2" / "Fn+Alt+F1" to open the command-terminal.
~~~~> Type "gearlock" and hit 'enter' key.
~~~~> Use the option one.


<<<<<<<<<>>>>>>Congrats and enjoy DarkMatter :)<<<<<<<<<<<>>>>>>>>>>