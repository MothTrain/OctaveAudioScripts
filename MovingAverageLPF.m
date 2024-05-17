function MovingAverageLPF(Envelope_Size, In_Path, Out_Path)
  if (nargin == 1)
    In_Path = "Audios/Default.wav";
    Out_Path = "Out/MovingAverageLPF.wav";
  elseif (nargin != 3)
    disp([num2str(nargin), " is not a valid number of arguments"])
    return
  endif

  audio = audioread(In_Path);
  sample_rate = audioinfo(In_Path).SampleRate;


  for i = 1:length(audio)
    filtered_audio(i,:) = GetEnvelopeAverage(audio, Envelope_Size, i);
  endfor

  audiowrite(Out_Path,filtered_audio, sample_rate);
end

function retval = GetEnvelopeAverage(Audio, Envelope_Size, Ending_At)
  if (Ending_At-Envelope_Size < 0)
    Envelope = Audio(1:Ending_At,:);
  else
    Envelope = Audio(Ending_At-Envelope_Size+1:Ending_At , :);
  endif

  retval = mean(Envelope, 1);

end
