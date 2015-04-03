#!/bin/sh
# FFmpeg 简易内嵌字幕压制脚本 for Unix-like
# 版本：1.0
# 作者：@FPS罗兹
# 日期：2015年4月3日
# MIT协议，所有人可自由修改发布

# 输出视频参数
# 文件路径可使用绝对路径或相对路径，这里不再赘述

# 片源路径
FILE_PATH="FPSAR.mp4"
# 字幕文件路径
ASS_PATH="fpsar.ass"
# 输出视频尺寸
# 保留片源宽高比，使用"-1:720"即代表输出视频为720P
SCALE="-1:540"
# 输出码率
# 默认为平均视频+音频码率，请按需斟酌，"1200k"即代表1200kbps平均总码率
BITRATE="1200k"

# 压制
# 强制使用H.264，Slow预设以及所有线程
# 保留片源视频帧率与音频码率格式
# 输出文件名为"片源名+码率.mp4"
EXEC=ffmpeg
$EXEC -i $FILE_PATH -vf ass=$ASS_PATH,scale=$SCALE -b:v $BITRATE -c:v libx264 -preset slow -threads 0 "$FILE_PATH$BITRATE".mp4