#!/bin/bash

# What this script does: Combines a PNG image with a WAV audio file to create an MP4 video
# How it works:
#   1. Takes an image file and audio file as input
#   2. Uses FFmpeg to create a video with the image as background and audio as soundtrack
#   3. Outputs a compatible MP4 video file
# Dependencies: FFmpeg must be installed
# Environment: No special environment variables needed

set -euo pipefail  # Exit on any error, undefined variables, or pipe failures

# Function to display usage information
show_usage() {
    echo "Usage: $0 <image_file> <audio_file> [output_file]"
    echo ""
    echo "Examples:"
    echo "  $0 my-image.png ENTER_FILE_NAME_0.wav"
    echo "  $0 my-image.png ENTER_FILE_NAME_0.wav my_video.mp4"
    echo ""
    echo "Available WAV files in current directory:"
    ls -1 *.wav 2>/dev/null || echo "  No WAV files found"
}

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "❌ Error: FFmpeg is not installed!"
    echo "💡 Tip: Install FFmpeg using one of these methods:"
    echo "   macOS: brew install ffmpeg"
    echo "   Ubuntu/Debian: sudo apt install ffmpeg"
    echo "   Windows: Download from https://ffmpeg.org/download.html"
    exit 1
fi

# Check if we have the right number of arguments
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    echo "❌ Error: Wrong number of arguments!"
    show_usage
    exit 1
fi

# Get input files
IMAGE_FILE="$1"
AUDIO_FILE="$2"
OUTPUT_FILE="${3:-video_output.mp4}"  # Default output name if not provided

# Check if input files exist
if [ ! -f "$IMAGE_FILE" ]; then
    echo "❌ Error: Image file '$IMAGE_FILE' not found!"
    echo "💡 Tip: Make sure the file exists and the path is correct"
    exit 1
fi

if [ ! -f "$AUDIO_FILE" ]; then
    echo "❌ Error: Audio file '$AUDIO_FILE' not found!"
    echo "💡 Tip: Make sure the file exists and the path is correct"
    exit 1
fi

# Display what we're about to do
echo "🎬 Creating video from:"
echo "   📸 Image: $IMAGE_FILE"
echo "   🎵 Audio: $AUDIO_FILE"
echo "   📹 Output: $OUTPUT_FILE"
echo ""

# Run FFmpeg command
echo "🔄 Processing with FFmpeg..."
ffmpeg -loop 1 -i "$IMAGE_FILE" -i "$AUDIO_FILE" \
    -c:v libx264 -tune stillimage \
    -c:a aac -b:a 192k \
    -pix_fmt yuv420p \
    -shortest \
    -y \
    "$OUTPUT_FILE"

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Success! Video created: $OUTPUT_FILE"
    echo "📊 File size: $(du -h "$OUTPUT_FILE" | cut -f1)"
    echo "💡 Tip: You can play this video with any media player"
else
    echo ""
    echo "❌ Error: FFmpeg failed to create the video"
    echo "💡 Tip: Check that your input files are valid and not corrupted"
    exit 1
fi
