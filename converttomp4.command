#! /bin/bash
convHome=$(pwd)
original="original"
rootfolder="/Users/Shared/Footage/Videokassetten Franzi Kindheit"

if true
then
	echo "Clearing original folder ..."

	rm -r $original

	echo "Copying files videos from: '$rootfolder'"

	mkdir $original
	cd "$rootfolder"
	find ./ -type f \( -iname \*.VOB -o -iname \*.MOD \) | cpio -pdm "$convHome"/$original
fi

cd "$convHome"

echo "Starting conversion in "$(pwd)" ..."

find ./ -type f \( -iname \*.VOB -o -iname \*.MOD \) -exec ./ffmpeg -i {} -vf yadif=parity=auto {}.mp4 \;

exit 0
