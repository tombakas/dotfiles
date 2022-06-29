OUTPUT_DIR=/home/$(whoami)/Documents/X11_grab/$(date +"%d_%m_%y__%Hh%Mm%Ss")
mkdir -p $OUTPUT_DIR

resolution=$(xrandr | awk '/\*/{print $1}')
width=$(echo $resolution | cut -d x -f 1)
height=$(echo $resolution | cut -d x -f 2)

ffmpeg -f x11grab -s ${width}x${height} -r 25 -i :0.0 -c:v libx264 -preset fast -pix_fmt yuv420p -s ${width}x${height} -threads 0 $OUTPUT_DIR/output.mp4
