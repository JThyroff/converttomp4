#! /bin/bash
convHome=$(pwd)
original="original"
rootfolder="/Users/Shared/Footage"

if false
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

exit 1

For i in (find ./ -type f \( -iname \*.VOB -o -iname \*.MOD \));
	do ffmpeg -i "$i" -vf yadif=parity=auto "$i".mp4
Done