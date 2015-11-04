#################################################################################
# Tested on OSX and requires exiftools
# Usage picChangeModTime.sh Path_of_directory
#################################################################################


if [ ! -z "$1" ];then
echo " Path is $1"
for FILE in $( ls -1 "$1")
	do
	#FILE=_20150828_124233_check\ copy.jpg
	imageDate=`exiftool -CreateDate "$FILE" |cut -c 35-50`
	imageDate=`echo $imageDate|tr -d ':'|tr -d ' '`
	#echo $imageDate
	touch -t $imageDate $FILE
done
else
	echo "You need to provide a path"
fi
