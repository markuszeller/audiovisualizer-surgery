![java processing3](https://img.shields.io/badge/java-processing3-orange)
![licence MIT](https://img.shields.io/badge/license-MIT-green)
![video FFMPEG](https://img.shields.io/badge/video-FFMPEG-blue)

# Audio Visualizer : Surgery

I needed some **audio visualizer** to present the actual waveform for my music videos. As I am not using a professional video editor which is capable with this kind of plugins, I did not find any simple and easy to use solution to have a little waveform like display.

So I decided to code my own to export as a video, which I can overlay on the cover with my video editor.

This is a 360 x 64 example.    
![Small example](examples/export.gif)

This audio visualizer is called Surgery, because it looks a bit like a oscilliscope in a hospital. Maybe I am going to code some others.

## Requirements

- [Processing Java Version](https://processing.org/download/)
- [Processing Sound Library](https://processing.org/reference/libraries/sound/index.html)
- [Processing Video Export Library](https://funprogramming.org/VideoExport-for-Processing/)
- [FFMPEG](https://www.ffmpeg.org/download.html)

## Instructions and notes

- Use the configuration as below.
- Hit <kbd>ESC</kbd> or close the window to stop.
- It will autostop when the **soundFile** ended, but it will run as long the history waveform is nulled. This extra space leaves some room for smoother video editing.

## Configuration

In this program you can configure some options to influence the video produced and to be auto-saved.

The code has at the beginning a configuration section. The options are described below and summarized in the code itself. Default values are included.

- **renderSize**  
To specify the render size set the resolution in the setup() method. For HD I use 1280 x 64 and set it in the size() method like below. You can use any height, but a smaller stripe looks better. *Unfortunately this can not be a variable like the others due to [Processing](https://processing.org/) limitation.*  
    ```size(1280, 64);```  

- **fps**  
    How many frames per second does your video have? 30 fps looks smooth, but you can also use more like 60 or 120.

- **soundFile**  
   Filename of the sound file from which the waveform should be displayed. For simple access, place in the data directory and give a name like "data/song.wav".

- **videoFile**  
    Filename of the the video file to be exported. It should be written into the data directory an look like "data/export.mp4".

- **margin**  
    Keep a margin from top and bottom of the rendered lines.

- **antiAlias**  
    When drawing the lines, they are smoothed by antiAlias value. 2 would affect a 2x2 blurring.

- **doMask**  
    When the cursor ran from left to right, a mask is applied, when doMask is **true**. To disable use **false**.

- **colorMask**  
    When the cursor ran from left to right, this mask value is evaluated when **doMask** is true. It can be used to apply a color filter. It is applied to RRGGBBAA where R=red, G=green, B=blue, A=alpha and every value is hex coded.

- **doBlur**  
    When the cursor ran from left to right, a blur is applied with the strength of **blurStrength**. This is only applied if the value is **true**. To disable set to **false**.

- **blurStrength**  
    Blur is applied, when the cursor ran from left to right and **doBlur** is true.  The entire window will be smoothed by this blurStrength value. 2 would affect a 2x2 blurring.

- **drawCursor**  
    A line cursor will be drawn to show current position, only if the value is **true**. To disable set to **false**.

- **cursorColor**  
    Color of the line cursor. Will only be drawn if **drawCursor** is **true**.

- **lineColor**  
    Color of the waveform.

- **backgroundColor**  
    Color of the background.
