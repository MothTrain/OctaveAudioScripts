function AddEcho(depth, delay, In_Path, Out_Path)
  if (nargin == 2)
    DefaultAddEcho(depth,delay);
  elseif(nargin == 4)
    SpecificAddEcho(depth, delay, In_Path, Out_Path);
  else
    disp([num2str(nargin), " is not a valid number of arguments"])
  endif
end

function DefaultAddEcho(Depth, Delay)
  Default_In_Path = "Audios/Default.wav";
  Default_Out_Path = "Out/EchoAdded.wav";

  SpecificAddEcho(Depth, Delay, Default_In_Path, Default_Out_Path);
end

function SpecificAddEcho(Depth, Delay, In_Path, Out_Path)
  workingDirectory = fileparts(mfilename('fullpath'));
  cd(workingDirectory);

  audio = audioread(In_Path);
  sample_rate = audioinfo(In_Path).SampleRate;

  sample_shift = sample_rate*Delay;

  edited_audio = AddEchoLayers(audio, Depth, sample_shift, 2);

  audiowrite(Out_Path, edited_audio, sample_rate);
  disp(["Audio Echo added. Exported to: ", Out_Path])
end



function retVal = AddEchoLayers(Audio, Echo_Coefficient, Spacing, max_Layers)
  Audio_Length = rows(Audio);

  layer = 0;

  With_Echo = Audio;


  do
    layer++;

    Echo_Layer = padarray(Audio, [Spacing*layer, 0],0, 'pre');
    Echo_Layer = Echo_Layer * (Echo_Coefficient/layer);

    With_Echo = padarray(With_Echo, [Spacing, 0], 0, 'post');
    With_Echo = Echo_Layer + With_Echo;
  until (layer >= max_Layers)

  retVal = With_Echo(1:Audio_Length,:);
end
