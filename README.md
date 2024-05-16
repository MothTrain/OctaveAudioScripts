# Octave Audio Scripts

The octave audio scripts is a collection of scripts for [GNU Octave](https://octave.org/) 
that allow for basic audio editing with various audio file formats.

# Requirements

- An installation of *GNU octave*
- A collection of audio files, preferably in the *Audios* directory. Various audio formats are supported.

**Note:** To check what formats are supported by your installation of Octave, use the *audioformats()*
function in your Octave command window.

# Usage

To use the Octave scripts, open an instance of Octave cli or gui and navigate the current working directory to the 
*OctaveAudioEditorScripts*, which is the root directory of this project, Or otherwise the directory containing
the script you want to execute. To navigate in Octave cli, use the *cd* command:

    octave:X> cd C:\Users\USER123\MyFolder\OctaveAudioEditorScripts

From there you can use any of the functions listed in the API below by typing in the function name into the command
window, followed by comma separated arguments, wrapped in brackets. For example

    VolumeChange(0.8, "Audios/Default.wav", "Out/VolumeDecreased.wav")

---

# API

### VolumeChange (*volume_factor*)
A convenience function for *VolumeChange(Volume_Factor, In_Path, Out_Path)*<br>
Increases or decreases the volume by *volume_factor*. A volume_factor of 0.5 will half
the audio amplitude and 2 will double the amplitude.

Assumes the *from* file is Audios/Default.wav
and the *out* file is Out/VolumeIncrease.wav. It is the equivalent to calling
*VolumeChange(volume_factor, "Audios/Default.wav", "Out/VolumeIncrease.wav")*

`volume_factor` - Coefficient of volume change.

### VolumeChange (*Volume_Factor, In_Path, Out_Path*)
Increases or decreases the volume by *volume_factor*. A volume_factor of 0.5 will half
the audio amplitude and 2 will double the amplitude.

`Volume_Factor` - Coefficient of volume change. <br>
`In_Path` - The path of the audio file to read from/edit <br>
`Out_Path` - The path of the file to write edited audio to


### AddEcho (*Depth, Delay*)
Adds an echo effect onto audio read from *Audios/Default.wav* and written to *Out/EchoAdded.wav*. The audio will have added repetitions of itself quieter
by a coefficient of *Depth* and will be repeated at intervals spaced *Delay* seconds apart

`Depth` - How much quieter should each echo be than the previous <br>
`Delay` - How far echos should be "spaced out"

### AddEcho (*Depth, Delay, In_Path, Out_Path*)
Adds an echo effect onto audio. The audio will have added repetitions of itself quieter
by a coefficient of *Depth* and will be repeated at intervals spaced *Delay* seconds apart

`Depth` - How much quieter should each echo be than the previous <br>
`Delay` - How far echos should be "spaced out" <br>
`In_Path` - The path of the audio file to read from/edit <br>
`Out_Path` - The path of the file to write edited audio to