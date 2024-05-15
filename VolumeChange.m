function VolumeChange(Volume_Factor, In_Path, Out_Path)

  if (nargin == 1)
    Default(Volume_Factor)
  elseif(nargin == 3)
    Specific(Volume_Factor, In_Path, Out_Path)
  else
    disp([num2str(nargin), " is not a valid number of arguments"])
  endif
end

function Default(Volume_Factor)
  workingDirectory = fileparts(mfilename('fullpath'));
  cd(workingDirectory);

  audio = audioread("Audios/Default.wav");
  sample_rate = audioinfo("Audios/Default.wav").SampleRate;

  edited_audio = audio * Volume_Factor;

  Default_Out_Path = "Out/VolumeIncrease.wav"
  audiowrite(Default_Out_Path, edited_audio, sample_rate);
  disp(["Audio volume changed by factor of ", num2str(Volume_Factor), ". Exported to: ", Default_Out_Path])
end

function Specific(Volume_Factor, In_Path, Out_Path)
  workingDirectory = fileparts(mfilename('fullpath'));
  cd(workingDirectory);

  audio = audioread(In_Path);
  sample_rate = audioinfo("Audios/Default.wav").SampleRate;

  edited_audio = audio * Volume_Factor;

  audiowrite(Out_Path, edited_audio, sample_rate);
  disp(["Audio volume changed by factor of ", num2str(Volume_Factor), ". Exported to: ", Out_Path])
end
