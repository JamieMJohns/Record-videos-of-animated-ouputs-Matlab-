function writerObj_out=record_video(details,writerObj,action)
% Code created by Jamie M Johns 2019
%  Github repository: https://github.com/JamieMJohns/Record-videos-of-animated-ouputs-Matlab-
%details={fps(double/single),video_title,overwrite(=1=overwrite if same name exist,0=add "_n" (n=int) if file name exist)
%action= 1 = intialise video (for action 1, writerObj can be anything, for =2 or 3;  writerObj must be created object from action=1)
%action = 2 = capture frame;
%action = 3 = stop recording;
% EXAMPLE USAGE (in code) #################################################################################
%   record_details={30,'my_video',0} %<<<<<<< {fps,title,and overwrite condition(0,1)}
%   video_object=record_video(record_details,nan,1); %<<<<<<<<<<<< [1] initial video object 
%       figure(1);
%       for k=1:300; %for each frame to draw [with 300 frames and 30fps, final video run time will be 10 seconds]
%           {{{code to update frame}}}
%           drawnow %<<<<<<<<<< necessary to update frame
%           video_object=record_video(record_details,video_object,2); %<<<<<<<<<<<<<< [2] capture current frame 
%       end
%      video_object=record_video(record_details,video_object,3); %<<<<<<<<<<<<<< [3] close video object (finish recording)
%################################################################################################


fps=details{1}; %frames pers second for your video
recording=1; %=1 if record animated output
vidname=details{2};  % NAME OF YOUR VIDEO vidname must include ' ' (define vidname as string)
overwrite=details{3};% if =0 and video with same file name as above; '_new' will added on to file name to avoid overwriting
                    % else file with same as above (defined by myfirstvideo) will be overwrittern during record

                    
                    
if action==1 %intialise
               %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@         
              % check that no file exists with the same name, and modify if exists and overwritevid~=0
               
                fprintf('\nVideo object created for video recording\n The output path of your video is:\n %s\n',pwd) %print, in command window, location of saved video file
  k=1; %integer for renamed video (if file already exists)
  vidnameo=vidname; %original vid name
       while (exist([pwd '\' vidname '.avi'], 'file')==2) && (overwrite~=1)%pwd=current directory (=2 if exist ,=0 if not)    
       vidname=[vidnameo '_' num2str(k)];  %renam video to "(specifiedvideoname)_n' , n=integer
        fprintf('\n    This file already exists so file is renamed to:\n    %s\n',[vidname '.avi'])
   k=k+1;
       end
              %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
              
        writerObj0 = VideoWriter([vidname '.avi']); %initiate writer object and .avi file (can probably use others such as .wmv but I use .avi)
             writerObj0.FrameRate = fps; %denote frame rate of output video
          writerObj0.Quality = 100;   %100 equal 100 percent quality, 0 = 0% quality (100 is best)
          open(writerObj0); %open writer object for recording 
       writerObj_out=writerObj0;
elseif action==2 %frame capture and add to video
    frame = getframe(gcf);
   writeVideo(writerObj,frame);  
   writerObj_out=writerObj;
elseif action==3 %stop recording
    close(writerObj);
    fprintf('\nVideo object CLOSED\n The output path of your video is:\n %s\n',pwd) %print, in command window, location of saved video file
    writerObj_out=nan;
end



end
