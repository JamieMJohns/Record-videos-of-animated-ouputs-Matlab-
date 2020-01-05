% HOW TO RECORD VIDEOS IN MATLAB

% code created by Jamie M. Johns 2016 (tested in matlab version R2013b)


% note: there are several ways to record videos, this is the method that
%       I have used and have been using for a long while.
%       And as far as I am aware this code should not require extra matlab 
%       toolboxes/extenstions, it should run on standard versions of matlab.
%       However, this has only been tested for version R2013b of matlab

% Also note that when you are recording a video (at least with this technique)
% the speed of the animation during recording may slow down significantly
% but is dependedant on pc specs (such as gpu and cpu).

%This code is split into 4 sections;

% Notice; [section 1] and [section 2] are only meant for reading 
%          (compiling them may result in errors)

%[section 1] - list of components that I use for recording videos (3 main components/parts)
%[section 2] - summarised template for positioning and using components from [section 1]
%[section 3] - example following the template of [section 2]
%[section 4] - advanced version of [section 3]; has more features and options for the user

%-> To run individual sections, click on section and press Ctrl+ENTER

%Enjoy :-)







%% [SECTION 1]: Summary of parts for recording (READ ONLY!)

%NOTICE: DO NOT NAME ANY VARIABLES as "pwd" (enter "help pwd" into matlab for more info) as pwd is already used in this code
 %       AND FIGURE(1) MUST REMAIN IN FOREGROUND OF MONITOR, DURING RECORDING
 
% ###########= seperate parts for video recording
%@@@@@@@@@@@@@@ and =============  is to make easier to observe specific sections of the code





% Part1: initialise recording object###########################################################################################111111111111111111111111111111
%recording parameters=================================================================
fps=30; %frames pers second for your video
recording=1; %=1 if record animated output
vidname='myfirstvideo';  % NAME OF YOUR VIDEO vidname must include ' ' (define vidname as string)
overwrite=0;% if =0 and video with same file name as above; '_new' will added on to file name to avoid overwriting
               % else file with same as above (defined by myfirstvideo) will be overwrittern during record
 %=================================================================================================================  
    if recording == 1 %if video is being recorded
        
            %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@         
              % check that no file exists with the same name, and modify if exists and overwrite~=0
                fprintf('\n The output path of your video is:\n %s\n',pwd) %print, in command window, location of saved video file
  k=1; %integer for renamed video (if file already exists)
  vidnameo=vidname; %original vid name
       while (exist([pwd '\' vidname '.avi'], 'file')==2) && (overwrite~=1)%pwd=current directory (=2 if exist ,=0 if not)    
       vidname=[vidnameo '_' num2str(k)];  %renam video to "(specifiedvideoname)_n' , n=integer
        fprintf('\n    This file already exists so file is renamed to:\n    %s\n',[vidname '.avi'])
   k=k+1;
       end
              %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
              
        writerObj = VideoWriter([vidname '.avi']); %initiate writer object and .avi file (can probably use others such as .wmv but I use .avi)
             writerObj.FrameRate = fps; %denote frame rate of output video
          writerObj.Quality = 100;   %100 equal 100 percent quality, 0 = 0% quality (100 is best)
          open(writerObj); %open writer object for recording
    end
%####################################################################################################################################1111111111111111111111



% part 2: record current frame of figure(1) #########################################################################################2222222222222222222222
%note if figure(2), swap 1 for 2 [below] 
if recording == 1
            frame = getframe(figure(1)); % grabs current frame
   writeVideo(writerObj,frame);  %writes current frame to video
 end
%#################################################################################################################################22222222222222222222222222  




%Part3: save the recorded frames as video########################################################################################333333333333333333333333333333
if recording == 1   
close(writerObj); % closes writer object
fprintf('video output location: \n %s\n',pwd)
end
%###############################################################################################################################33333333333333333333333333333333



%% [SECTION 2]: TEMPLATE FOR USING [SECTION 1] (READ ONLY)

%NOTICE: DO NOT NAME ANY VARIABLES as "pwd" (enter "help pwd" into matlab for more info) as pwd is already used in this code
 %       AND FIGURE(1) MUST REMAIN IN FOREGROUND OF MONITOR, DURING RECORDING
 
% ######## = necessary parts for recorder
% !!!!!!!!!!!!!!!!!!! = only related to calculations for what will be animate in recording


%Included in beginning of my codes as a standard!!!!!!!!!!!!!!
close all %close any open figures
clear all %clear workspace
clc       % clear command window
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%!!!!!!!!!!!!!!!!!!!!!!!!!!!
 % (define paramters for calculations)
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



% Part1 initialise recording object###############################################################################1111111111111111111111111
%recording parameters======================================
fps=30;
recording=1; 
vidname='myfirstvideo';
overwrite=0;
%=========================================================
if recording == 1
      fprintf('\n The output path of your video is:\n %s\n',pwd) %print, in command window, location of saved video file
  k=1; %integer for renamed video (if file already exists)
  vidnameo=vidname; %original vid name
       while (exist([pwd '\' vidname '.avi'], 'file')==2) && (overwrite~=1)%pwd=current directory (=2 if exist ,=0 if not)    
       vidname=[vidnameo '_' num2str(k)];  %renam video to "(specifiedvideoname)_n' , n=integer
        fprintf('\n    This file already exists so file is renamed to:\n    %s\n',[vidname '.avi'])
   k=k+1;
       end
writerObj = VideoWriter([vidname '.avi']); %title
     writerObj.FrameRate = fps; %frame rate
  writerObj.Quality = 100;   %100 equal 100 percent quality 
  open(writerObj);
else 
end
%##############################################################################################################11111111111111111111111111111111111111111111111111


%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 % (run calculations for animation; i.e- for loops, while loops, etc)
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




%Animate and record calculations $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
for j=1:N % for each step of calculation (e.g- N number of time steps)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     

%plot each time step for calculation=====================================================================
% for example [use any function to display calculations (i.e-plot,plot3,surf,mesh,streamline,etc....) ;

% figure(1)
% plot(x(j),y(j)
%               or, plot3(x(j),y(j),z(j))
%               or, surf(x(:,:,j),y(:,:,j),z(:,:,j)))
%                or, surf(x,y,z(:,:,j))) ; if x and y are unchanged and size(x)=size(y)=size(z(:,j))

% xlim([a b])
% ylim([a b])

%=====================================================================================================

drawnow   %<=== THIS IS NECESSARY TO UPDATE FIGURE TO jth step

% part 2 record current figure (at jth step ##########################################################################################################22222222222222222222222222222222222222
 if recording == 1
            frame = getframe(figure(1));
   writeVideo(writerObj,frame);  
 end
%######################################################################################################################################################%22222222222222222222222222222222222222  
end%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


% after loop of calculating animating (at end of code)

%Part 3 save the video file ########################################################################################################################3333333333333333333333333333333333333333
if recording == 1   
close(writerObj);
end
%#############################################################################################################################################333333333333333333333333333333333333333



%% Section 3: EXAMPLE - record projectile motion simulation (Basic version) 
close all
clear all
clc

%NOTICE: DO NOT NAME ANY VARIABLES as "pwd" (enter "help pwd" into matlab for more info) as pwd is already used in this code
 %       AND FIGURE(1) MUST REMAIN IN FOREGROUND OF MONITOR, DURING RECORDING
 
% THIS IS AN EXAMPLE OF APPLYING SECTION 2 TO RECORD A VIDEO OF CALCULATIONS 
% THAT HAVE RESULTS VARYING OVER TIME; FOR THIS EXAMPLE "PROJECTILE MOTION"
% (1)-> THE USER SPECIFIES PARAMETERS (BELOW) ABOUT THE PROJECTILE
% (2)-> THE USED SPECIFIES PARAMETERS FOR RECORDED VIDEO
% (3)-> THE POSITION OF PROJECTILE WITH RESPECT TO TIME IS CALCULATED
% (4)-> THE POSITION OF PROJECTILE, AT EACH INSTANT OF TIME, IS PLAYED BACK
%       AS AN ANIMATION AND RECORDED AS A VIDEO FILE


%parameters for projectile motion!!!!!!!!!!!!!!!!!
% use the default settings first (then check size of output video (mb))
p=[0 0];  % initial position [x,y]
velx=5;   % velocity in x direction in meters per second
vely=20;  % velocity in y direction in meters per second
grav=9.81; % acceleration in -y direction in meter per second squared
dt=0.01;   % delta time in seconds
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%Part1 initialise recording object################################################################################111111111111111111111111111111111111111111111111
%recording parameters======================================
fps=20; %frames pers second
recording=1; %=1 if record
overwrite=1; %=1 if you want overwrite vids of same name
commandwindow
vidname='my projectile motion video';  % vidname must include ' ' (define vidname as string)
if recording == 1  
  fprintf('\n The output path of your video is:\n %s\n',pwd) %print, in command window, location of saved video file  
  fprintf('The name of the video is;\n%s\n',vidname)
  k=1;
  vidnameo=vidname; %original vid name
       while (exist([pwd '\' vidname '.avi'], 'file')==2) && (overwrite~=1)%pwd=current directory (=2 if exist ,=0 if not)    
       vidname=[vidnameo '_' num2str(k)]; 
        fprintf('\n    This file already exists so file is renamed to:\n    %s\n',[vidname '.avi'])
   k=k+1;
       end
  %=============================================================   
writerObj = VideoWriter([vidname '.avi']); %title
     writerObj.FrameRate = fps; %frame rate
  writerObj.Quality = 100;   %100 equal 100 percent quality 
  open(writerObj);
end

%###################################################################################################################111111111111111111111111111111111111111111111



% CALCULATIONS FOR PROJECTILE MOTION!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
x=p(1);
y=p(2);
j=2;
landed=0;

while landed==0
 x(j)=x(1)+velx.*dt.*(j-1);
 vely=(vely-grav.*dt);
 y(j)=y(1)+vely.*dt.*(j-1);
 
 
 landed=y(j)<0;
 
 y(j)=(landed==0).*y(j);
 j=j+(landed==0);
 
   
end
% after calculations their are j time-steps (or j individual positions to record)
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


% running animation$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
figure(1) %open figure(1)
 hold on
plt1=plot(x(1),y(1),'r--'); %plot red tracer
plt2=plot(x(1),y(1),'b.','markers',15); %plot blue marker to indicate position
pt=1;
tic 
for k=1:j % for each time step (for each kth step) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    

 
set(plt1,'xdata',x(1:k),'ydata',y(1:k)) %new tracer
 set(plt2,'xdata',x(k),'ydata',y(k)) %new position
 str='Procjectile motion Simulation'; %sting for title
title(sprintf('%s\n velx=%.2fm/s vely=%.2fm/s accely=-%.2fm/s^2\n Time=%4fseconds',str,velx,vely,grav,(k-1).*dt)) %add current details to title
 xlabel('X (meters)') %xlabel
ylabel('Y (meters)')  % ylabel
xlim([x(1) x(j)]) % x-axis limits
ylim([y(1) max(y)])  %y-axis

drawnow  % REFRESH FIGURE 1 for kth step

%Part2 capture current frame at kth step#########################################################################################22222222222222222222222222222222222222222222
 if recording == 1
  frame = getframe(figure(1));
   writeVideo(writerObj,frame);  
 end 
%##################################################################################################################################222222222222222222222222222222222222222



end %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

%part3 close writer obj and save video#####################################################################################################3333333333333333333333333333333333333333333333
if recording == 1   
close(writerObj);
end
%#################################################################################################################################################3333333333333333333333333333333333333333

%% Section 4: EXAMPLE - record projectile motion simulation (ADVANCED version)

%NOTICE: DO NOT NAME ANY VARIABLES as "pwd" (enter "help pwd" into matlab for more info) as pwd is already used in this code
 %       AND FIGURE(1) MUST REMAIN IN FOREGROUND OF MONITOR, DURING RECORDING
 
% ######## = necessary parts for recorder
% !!!!!!!,$$$$$$$$$$,@@@@@@@@@,&&&&&&&& = code section dividers (to help with visual sepereation of code)

% This is very similar to the above section but includes more features;
%     --> window dialogue to describe specifications of video and current state of recording (using fprintf function)
%         This includes pauses that wait for the user to press enter 
%     -->matlab tells user in command window the progress of recording (percentage that has been recorded)
%     --> more options to specify recording;
%     ---> set custom time length for output video;
%           time-steps from calculations will either be skipped
%           or individual time-steps will be repetively recorded to satisfy required
%           time length set by user (that is also with respect to frame rate set by the user)
%     ---> Allow for user to set custom resolution of recording by manual scaling
%          figure(1) with their mouse [before recording begins].
% (REFER TO SECTION 3 for a more simple example)


close all
clear all
clc


%parameters for projectile motion!!!!!!!!!!!!!!!!!
p=[0 0];  % initial position [x,y]
velx=5;   % velocity in x direction in meters per second
vely=20;  % velocity in y direction in meters per second
grav=9.81; % acceleration in -y direction in meter per second squared
dt=0.01;   % delta time in seconds
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%######################################################################################################################################11111111111111111111111111111
%recording parameters===============================================
fps=30; %frames pers second
recording=1; %=1 if recording
timelengthvid=15; %required time length of output video (in seconds)
overwrite=0; %=0 don't want to overwrite files of samename, else =anyother number
commandwindow %bring command window to foreground
vidname='my projectile motion video';  % vidname must include ' ' (define vidname as string)
%====================================================================
if recording == 1
      fprintf('\n You are recording video titled:\n %s\n',[vidname '.avi'])
      
%determine if file exists!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    fprintf('of %.2f frames per second\n',fps)
     fprintf('and desired running time of %.2fseconds\n',timelengthvid)
    fprintf('\n output path: %s \n',pwd)
  k=1;
  vidnameo=vidname; %original vid name
       while (exist([pwd '\' vidname '.avi'], 'file')==2) && (overwrite~=1)%pwd=current directory (=2 if exist ,=0 if not)    
       vidname=[vidnameo '_' num2str(k)]; 
        fprintf('\n    This file already exists so file is renamed to:\n    %s\n',[vidname '.avi'])
   k=k+1;
       end
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
 
  
writerObj = VideoWriter([vidname '.avi']); %title
     writerObj.FrameRate = fps; %frame rate
  writerObj.Quality = 100;   %100 equal 100 percent quality 
  open(writerObj);

else recording~=1
    fprint('No video output will be recorded of animation: \n')
   fprint('as paramater "recording" does not equal 1 \n')
end

%#######################################################################################################################################111111111111111111111111111111111


% CALCULATIONS FOR PROJECTILE MOTION!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
x=p(1);
y=p(2);
j=2;
landed=0;
ively=vely;
while landed==0
 x(j)=x(1)+velx.*dt.*(j-1);
 vely=(vely-grav.*dt);
 y(j)=y(1)+vely.*dt.*(j-1);
 
 
 landed=y(j)<0;
 
 y(j)=(landed==0).*y(j);
 j=j+(landed==0);
 
   
end
fprintf('\n FOR YOUR PROJECTILE MOTION: \n')
fprintf('velx=%.2f m/s vely(initial)=%.2f m/s accely=-%.2fm/s^2 dt=%.2fseconds\n',velx,ively,grav,dt)
fprintf('the projectile landed after %.2fseconds\n',(j-1).*dt);
fprintf('with a total %.0f time-steps\n\n',j)
% after calculations their are j time-steps (or j individual positions to record)
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


if recording==1 % PRINT DETAILS ABOUT TIME AND FRAME RATE OF VIDEO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    % This section determine if,during recording, time-steps need to be skipped
    % or if individual frames need to be repeatively recorded; to satisfy
    % the video frame rate and video time lenght specified by the user
    
fneed=fps*timelengthvid;
rep=j/fneed;  %  value rep should be in range:   0<rep<=1
fprintf('\n The required number of time-steps, from calculations, required to record\n')
fprintf('your video with a timelength of %.2f seconds at %.2f frames per second \n',timelengthvid,fps);
fprintf('is a total of %.0f frames \n',round(fneed))

        if rep<1 %if not enough timesteps in calculation to match required timelength

        rep=round(1/rep);
        inc=1;
        fprintf('\n The calculations only produced %.0f time-steps \n',j)
        fprintf('therefore each frame will be recorded %.0f times\n',rep);
        fprintf('to achieve desired video time length of around %.2f seconds\n',timelengthvid)
        fprintf('(actual video time will be close to %.2fseconds)\n',j.*rep./fps)
        fintime=j.*rep./fps;
        elseif rep==1 %if the number of time steps is equivalent to number of frames required for recording
            rep=1;
            inc=1;
        fprintf('\n The calculations produced the exact right number of time steps required:\n')
        fprintf('\n %.0f timesteps\n',j)
        fintime=timelengthvid;
        elseif rep>1  %if there are more time-steps than required number of frames
        inc=round(rep);
        rep=1;   
        fprintf('\n The calculations produced %.0f time-steps \n',j)
        fprintf('therefore time-steps will be skipped in increments of %.0f steps \n',inc);
        fprintf('to achieve a video time length of around %.2f seconds\n',timelengthvid)
        fprintf('(actual video time will be close to %.2fsecond)\n',length(1:inc:j)/fps)
           fintime=length(1:inc:j)/fps; 
        end
else % if animation is not being recorded than play each time step at one frame per second
    inc=1;
    rep=1;
   
end
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%


% SET UP FIGURE RESOLUTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if recording==1

    fprintf('\nNow, figure(1) to viewing and recording of animation \n')
    input('<PRESS ENTER TO OPEN FIGURE(1)>')
    fprintf('\n Figure(1) is open \n')
    figure(1)
    title(sprintf('STRETCH THIS WINDOW TO SET RESOLUTION FOR RECORDED VIDEO \n [LOOK AT COMMAND WINDOW FOR FURTHER INSTRUCTIONS]'))
xlabel('x(meters)')
ylabel('y(meters)')
fprintf('\nNOTE: YOU MUST KEEP FIGURE(1) IN FOREGROUND (OF MONITOR) DURING RECORDING\n')
    input('<PRESS ENTER to begin animation playback>')
  windpos=get(figure(1),'position');  % this records video resolution and position that you manually set with your mouse
else
    figure(1)
    fprintf('Stretch figure(1) to resolution that you want to view animation\n')
    input('and ENTER to begin animation playback')
  windpos=get(figure(1),'position');   % this records video resolution and position that you manually set with your mouse 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%plotting the time steps and recording for video&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

figure(1)
set(figure(1),'position',windpos) %set figure(1) to previously specified resolution and position
 hold on
plt1=plot(x(1),y(1),'r--'); % plot red tracer
plt2=plot(x(1),y(1),'b.','markers',15); % plot position marker
pt=1;
tic 
fprintf('Recording started at %.2fseconds \n',toc)
framecount=0;
for k=1:inc:j % FOR EACH TIME STEP THAT IS BEING RECORDED @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    


set(plt1,'xdata',x(1:k),'ydata',y(1:k)) % update tracer
 set(plt2,'xdata',x(k),'ydata',y(k)) % update position marker
 title(sprintf('Procjectile motion Simulation \n velx=%.2fm/s vely=%.2fm/s accely=-%.2fm/s^2\n Time=%4fseconds',velx,vely,grav,(k-1).*dt))
 %ABOVE: update title with current details (i.e-current time)
 xlabel('X (meters)')
ylabel('Y (meters)')  
xlim([x(1) x(j)])
ylim([y(1) max(y)])  

drawnow % UPDATE FIGURE(1) to current kth frame (THIS IS NECESSARY to be above part 2)


%Part2 capture current frame#######################################################################################################################22222222222222222222222222222222
 if recording == 1
                     for r=1:rep
                            frame = getframe(figure(1));
                   writeVideo(writerObj,frame);  
                     framecount=framecount+1; % count frames recorded
                     end
 else
 end
 
%##################################################################################################################################################222222222222222222222222222222

         if (k./j >= pt.*0.1) && recording==1 ; % display progress increments 10% progress
            fprintf(' %.0f%% of recording completed at %.2fseconds \n',pt.*10,toc) 
             pt=pt+1;
         end

end%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&



%part3 close writer obj and save video###########################################################################################################################333333333333333333333333333333333333333333
if recording == 1   % SAVE VIDEO FILE AND PRINT FILE DETAILS ABOUT RECORDING 
    fprintf('\n OUTPUT VIDEO IS BEING PROCESSED (this can take a few seconds)\n')
close(writerObj);
  fprintf('\n Your video titled:\n %s\n',[vidname '.avi'])
  fprintf('has finished processing!!!! \n')
  fprintf('stats: %.0f frames at %.2f fps \n timelength:%.4f seconds\n',framecount,fps,fintime)
  fprintf('Located in: \n %s\n',pwd)
else
end
%###################################################################################################################################################################333333333333333333333333333333333333333




