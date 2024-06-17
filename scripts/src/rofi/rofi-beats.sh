#!/bin/sh

# https://github.com/Carbon-Bl4ck/Rofi-Beats/blob/main/rofi-beats

notification(){
	notify-send 'Now Playing: Lofi Radio ☕️🎶'
}

menu(){
	printf "1. Lofi Girl\n"
	printf "2. Chillhop\n"
	printf "3. Box Lofi\n"
	printf "4. The Bootleg Boy\n"
	printf "5. Radio Spinner\n"
	printf "6. SmoothChill"
}

main() {
	choice=$( (menu) | rofi -dmenu -p "Select station" | cut -d. -f1)

	case $choice in
		1)
			notification ;
				mpv "https://play.streamafrica.net/lofiradio"
			break
			;;
		2)
			notification ;
				mpv "http://stream.zeno.fm/fyn8eh3h5f8uv"
			break
			;;
		3)
			notification ;
				mpv "http://stream.zeno.fm/f3wvbbqmdg8uv"
			break
			;;
		4)
			notification ;
				mpv "http://stream.zeno.fm/0r0xa792kwzuv"
			break
			;;
		5)
			notification ;
				mpv "https://live.radiospinner.com/lofi-hip-hop-64"
			break
			;;
		6)
			notification ;
				mpv "https://media-ssl.musicradio.com/SmoothChill"
			break
			;;
	esac
}

pkill -f http || main
