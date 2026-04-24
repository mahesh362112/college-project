echo "Enter File Name : "
read file
if [ -r $file ]
then
    echo "File is Readable"
elif [ -w $file ]
then
    echo "File is Writeable"
elif [ -x $file ]
then
    echo "File is Executable"
else
    echo "File does not have any permissions"
fi