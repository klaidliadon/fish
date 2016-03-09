function adb-battery --description 'Returns the current battery level via adb'
	adb shell dumpsys battery > /dev/null;
	if test $status != 0 
		return $status
	end
	set a ( adb shell dumpsys battery | grep level | cut -d':' -f 2| tr -dc '0-9'); 
	printf "Battery level: %s%%\n" $a
end