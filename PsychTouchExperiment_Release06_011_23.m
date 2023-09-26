clc;
%cd C:Users\sride\OneDrive\Documents\MATLAB\
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% selection_history_battery
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
ClockRandSeed; 
% set size = 9 items x 4 quadrants = 36
% 1st column: 1 or 2 exemplars of second target (2 on 25% of trials)
% 2nd column: ID of first target (1 is most frequent [75% vs 41.7%], 2 is high-value)
% 3rd column: ID of second target (1 is most frequentg, 2 is high-value)
% 4th column: sometimes-target distractor (0=absent, 33% of trials)
% 5th column: salient distractor (0=absent, 5=common [x7 more likely than uncommon], 6=uncommon)
% 6th column: quadrant of 1st target, high-prob = 50%
% 7th column: quadrant of 2nd target, high-prob = 50%
% 8th column: quadrant of 3rd target (if present), high-prob = 50%
% 9th column: quadrant of distractor (if present), high-prob = 70%

% 8 non-targets x 4 (+1-2 depending on how many targets and if salient
% distractor), swap 1 for sometimes-target distractor if present

global trial_log
maxTrials = 2; %stop exp after maxTrials or 50 min of trials + breaks
trial_log = zeros(maxTrials,9);
pos_log = zeros(maxTrials,36);
quadrant = Shuffle([1:4]); %1 will be upper-right, 2 upper-left, 3 lower-right, and 4 lower-left (goes clockwise starting with upper-left)
high_prob_T_quad = quadrant(1);
high_prob_D_quad = quadrant(2);
low_prob_T_quad = quadrant([2:4]);
low_prob_D_quad = quadrant([1 3 4]);

for x = 1:maxTrials 
    rand_num = rand(1,8);
    nontargs = [Shuffle([7:14 7:14 7:14 7:14]) Shuffle([7:14])]; %pictures to be used for non-targets
    
    %determine whether there are 1 or 2 of the second target
    if rand_num (1)>.25 % 75 percent of the time
        trial_log(x,1)=1;
    else
        trial_log(x,1)=2;
    end
    
    %determine which images will be used for targets(2) and the sometimes
    %target distractor if present(0 if absent). Image #1 is the most
    %frequent target
    if rand_num(2)<.125 % 1/8th of the time
        trial_log(x,2:3) = [1 2];
        if rand_num(3)<.3333 % 1/3rd of the time
            trial_log(x,4)=0; % no sometimes-target distractor
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667 % 1/3rd of time
            trial_log(x,4)=3; 
        else
            trial_log(x,4)=4;
        end
    elseif rand_num(2)>=.125 && rand_num(2)<.25
        trial_log(x,2:3) = [1 3];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=2;
        else
            trial_log(x,4)=4;
        end
    elseif rand_num(2)>=.25 && rand_num(2)<.375
        trial_log(x,2:3) = [1 4];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=2;
        else
            trial_log(x,4)=3;
        end
    elseif rand_num(2)>=.375 && rand_num(2)<.5
        trial_log(x,2:3) = [2 1];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=3;
        else
            trial_log(x,4)=4;
        end
    elseif rand_num(2)>=.5 && rand_num(2)<.625
        trial_log(x,2:3) = [3 1];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=2;
        else
            trial_log(x,4)=4;
        end
    elseif rand_num(2)>=.625 && rand_num(2)<.75
        trial_log(x,2:3) = [4 1];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=2;
        else
            trial_log(x,4)=3;
        end
    elseif rand_num(2)>=.75 && rand_num(2)<.7917
        trial_log(x,2:3) = [2 3];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=1;
        else
            trial_log(x,4)=4;
        end
    elseif rand_num(2)>=.7917 && rand_num(2)<.8333
        trial_log(x,2:3) = [3 2];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=4;
        else
            trial_log(x,4)=1;
        end
    elseif rand_num(2)>=.8333 && rand_num(2)<.875
        trial_log(x,2:3) = [2 4];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=1;
        else
            trial_log(x,4)=3;
        end
    elseif rand_num(2)>=.875 && rand_num(2)<.9167
        trial_log(x,2:3) = [4 2];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=1;
        else
            trial_log(x,4)=3;
        end
    elseif rand_num(2)>=.9167 && rand_num(2)<.9583
        trial_log(x,2:3) = [3 4];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=1;
        else
            trial_log(x,4)=2;
        end
    else
        trial_log(x,2:3) = [4 3];
        if rand_num(3)<.3333
            trial_log(x,4)=0;
        elseif rand_num(3)>=.3333 && rand_num(3)<.6667
            trial_log(x,4)=1;
        else
            trial_log(x,4)=2;
        end
    end
    
    %this part determines whether one of the non-targets will be a salient
    %distractor, and if so, what its identity will be (image #5 or 6)
    if rand_num(4)<.3333
        trial_log(x,5)=0; 
    elseif rand_num(4)>=.3333 && rand_num(4)<.9167
        trial_log(x,5)=5;
    else
        trial_log(x,5)=6;
    end
    
    %this part determines the quadrant of each of the two, or if present
    %three, targets, favoring a high-probability quadrant
    if rand_num(5)<.5
        trial_log(x,6)=high_prob_T_quad;
    elseif rand_num(5)>=.5 && rand_num(5)<.6667
        trial_log(x,6)=low_prob_T_quad(1);
    elseif rand_num(5)>=.6667 && rand_num(5)<.8333
        trial_log(x,6)=low_prob_T_quad(2);
    else
        trial_log(x,6)=low_prob_T_quad(3);
    end
    if rand_num(6)<.5
        trial_log(x,7)=high_prob_T_quad;
    elseif rand_num(6)>=.5 && rand_num(6)<.6667
        trial_log(x,7)=low_prob_T_quad(1);
    elseif rand_num(6)>=.6667 && rand_num(6)<.8333
        trial_log(x,7)=low_prob_T_quad(2);
    else
        trial_log(x,7)=low_prob_T_quad(3);
    end
    if trial_log(x,1)==2
        if rand_num(7)<.5
            trial_log(x,8)=high_prob_T_quad;
        elseif rand_num(7)>=.5 && rand_num(7)<.6667
            trial_log(x,8)=low_prob_T_quad(1);
        elseif rand_num(7)>=.6667 && rand_num(7)<.8333
            trial_log(x,8)=low_prob_T_quad(2);
        else
            trial_log(x,8)=low_prob_T_quad(3);
        end
    end
    
    %this part determines the quadrant of the salient distractor, if
    %present, favoring a high-probability quadrant (that is different than
    %the one for targets)
    if trial_log(x,5)~=0
        if rand_num(8)<.7
            trial_log(x,9)=high_prob_D_quad;
        elseif rand_num(8)>=.7 && rand_num(8)<.8
            trial_log(x,9)=low_prob_D_quad(1);
        elseif rand_num(8)>=.8 && rand_num(8)<.9
            trial_log(x,9)=low_prob_D_quad(2);
        else
            trial_log(x,9)=low_prob_D_quad(3);
        end
    end

    %this part determines the exact position of the salient distractor
    %(always middle of the quadrant)
    if trial_log(x,9)==1
        Dpos = 5;
    elseif trial_log(x,9)==2
        Dpos = 14;
    elseif trial_log(x,9)==3
        Dpos = 23;
    elseif trial_log(x,9)==4
        Dpos = 32;
    else
        Dpos = 0;
    end
    
    %this part assigns each target to a location based on the quadrant it
    %is in while ensuring that each target is not in the same position as
    %the salient distractor or another target that has already been
    %assigned a position
    if trial_log(x,6)==1
        Tpos1 = randi([1,9]);
        while Dpos==Tpos1
            Tpos1 = randi([1,9]);
        end
    elseif trial_log(x,6)==2
        Tpos1 = randi([10,18]);
        while Dpos==Tpos1
            Tpos1 = randi([10,18]);
        end
    elseif trial_log(x,6)==3
        Tpos1 = randi([19,27]);
        while Dpos==Tpos1
            Tpos1 = randi([19,27]);
        end
    elseif trial_log(x,6)==4
        Tpos1 = randi([28,36]);
        while Dpos==Tpos1
            Tpos1 = randi([28,36]);
        end
    end
    if trial_log(x,7)==1
        Tpos2 = randi([1,9]);
        while Tpos2==Tpos1 || Tpos2==Dpos
            Tpos2 = randi([1,9]);
        end
    elseif trial_log(x,7)==2
        Tpos2 = randi([10,18]);
        while Tpos2==Tpos1 || Tpos2==Dpos
            Tpos2 = randi([10,18]);
        end
    elseif trial_log(x,7)==3
        Tpos2 = randi([19,27]);
        while Tpos2==Tpos1 || Tpos2==Dpos
            Tpos2 = randi([19,27]);
        end
    elseif trial_log(x,7)==4
        Tpos2 = randi([28,36]);
        while Tpos2==Tpos1 || Tpos2==Dpos
            Tpos2 = randi([28,36]);
        end
    end
    if trial_log(x,8)==1
        Tpos3 = randi([1,9]);
        while Tpos3==Tpos1 || Tpos3==Tpos2 || Tpos3==Dpos
            Tpos3 = randi([1,9]);
        end
    elseif trial_log(x,8)==2
        Tpos3 = randi([10,18]);
        while Tpos3==Tpos1 || Tpos3==Tpos2 || Tpos3==Dpos
            Tpos3 = randi([10,18]);
        end
    elseif trial_log(x,8)==3
        Tpos3 = randi([19,27]);
        while Tpos3==Tpos1 || Tpos3==Tpos2 || Tpos3==Dpos
            Tpos3 = randi([19,27]);
        end
    elseif trial_log(x,8)==4
        Tpos3 = randi([28,36]);
        while Tpos3==Tpos1 || Tpos3==Tpos2 || Tpos3==Dpos
            Tpos3 = randi([28,36]);
        end
    else
        Tpos3 = 0;
    end
    
    %this part replaces one of the regular non-target images with a
    %sometimes-target distractor if present
    if trial_log(x,4)>0
        to_replace = randi([7,14]);
        nontargs(nontargs==to_replace)=trial_log(x,4);
    end
    
    %this part assigns images to grid positions based on everything
    %determined above
    c=0;
    for y = 1:36
        if Tpos1==y
            pos_log(x,y)=trial_log(x,2);
        elseif Tpos2==y
            pos_log(x,y)=trial_log(x,3);
        elseif Tpos3==y
            pos_log(x,y)=trial_log(x,3);
        elseif Dpos==y
            pos_log(x,y)=trial_log(x,5);
        else
            c=c+1;
            pos_log(x,y)=nontargs(c);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%INFO%%%%%
totalTime = 48; % shuts down game after 50 minutes
disPoints = -500;
breakTrial = 50; % number of trials before break
paTime = 30; % secs per break


%key
excelAlpha = {'A','B','C','D','E','F','G','H','I','J','K', 'L','M', 'N',...
              'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',...
              'AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL'};

%%%%%Uncomment the following line if the SyncTest fails%%%%%
Screen('Preference', 'SkipSyncTests', 1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Generates prompt to input subject information%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prompt = {'Enter Subject Number:'};
default = {'0'};
title = 'Setup Info';
LineNo = 1;
answer = inputdlg(prompt,title,LineNo,default);
subjNo = cell2mat(answer); % get str subject no. to save data
[subjno_Str] = deal(answer{:});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Create file names, based on prior input%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileName=['S', subjno_Str, 'Training1.xls'];
pointFile = fopen(strcat(subjno_Str,"pointFile.txt"), "w");
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Set Screen Parameters%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
global w
bcolor = [0 0 0]; %RGB for black
WinNum = 0; %0 for one monitor, 1 for two or more monitors
SetResolution(WinNum,1024,768,60); %Window Number (monitor to use), Length of monitor resolution to use (in pexels), Height (in pexels), refresh rate of monitor (in Hz)
w = Screen('OpenWindow',WinNum,bcolor); %open a background window, designated variable "w", with a black background. You will present stimuli on this window
%set(gcf,'Pointer','custom','PointerShapeCData', NaN(16,16))
%set(w,'Pointer','custom','PointerShapeCData', NaN(16,16))

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Set Font Parameters%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
oldfont=Screen('TextFont', w, 'Arial');
oldsize=Screen('TextSize', w, 30);  
oldstyle=Screen('TextStyle', w, 1); 

global width height shift
[width, height]=Screen('WindowSize', WinNum);
shift = 100;
height = height - shift; 
Cx = width/2; %Cx is the middle/center pixel in the X dimension
Cy = height/2 + shift; %Cy is the middle/center pixel in the Y dimension

% dividing screen into 36 parts: 3x3 per 4 quadrants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
global numColumns numRows
numColumns = 6;
numRows = 6;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Create Touch Device %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dev = min(GetTouchDeviceIndices([],1));
TouchQueueCreate(w, dev);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% create array/grid for position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for rowQ = 1:3 % quad 1 & 2
    posArr(rowQ, 1:3) = 3*(rowQ-1)+1:3*(rowQ-1)+3;
    posArr(rowQ, 4:6) = 3*(rowQ-1)+10:3*(rowQ-1)+12;
end
for rowQ = 4:6 % quad 3 & 4
    posArr(rowQ, 1:3) = 3*(rowQ-4)+28:3*(rowQ-4)+30;
    posArr(rowQ, 4:6) = 3*(rowQ-4)+19:3*(rowQ-4)+21;
           
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global fileId mtimeRound
maxTime = 10; % time per trial to touch all targets 
mtimeRound =20;
%cd attachments
global sz1 Pict allNames standardNamesList % size of each picture list, all pictures
sz1 = [];
Pict_base = [];

standardNamesList = ["princess.png", "mario.png", "luigi.png", "daisy.png",... % targets
            "donkey.png", "bowser.png", ... % salient distractors
            "toad.png", "yoshi.png", "koopa.png", "birdo.png", ... % filler
            "wario.png", "boo.png", "goomba.png", "shy.png"]; % filler

standard = imread("toad.png");
booResizedtoBox = myResize(standard, width, height);
standardColoredPix = countNumColorPix(booResizedtoBox);
[standardMeanS,standardMeanV] = saturation(booResizedtoBox);

mscale = ones(1,14);
mscale(2) = 1.2; % luigi 
mscale(7) = .85; % yoshi, green
mscale(12) = .9; % goomba
mscale(5) = 1.1; % bowser, salient
mscale(4) = 1.4; % donkey kong, salient

for fname = 1:(length(standardNamesList)) % resize all images, ordered 
  img = imread(standardNamesList(fname));
  Pict_base = [Pict_base, Screen('MakeTexture',w,pixelResize(standardColoredPix,img, standardMeanS, standardMeanV, mscale(fname)))];
end

%% base list, indexes
a = uint32(1):uint32(length(standardNamesList));
aShuffle = shufflePartly(a);

Pict = [];
for i = 1:(length(a))
    Pict = [Pict, Pict_base(aShuffle(i))];
end

allNames = [];
for i = 1:(length(a))
    allNames = [allNames, standardNamesList(aShuffle(i))];
end
highValTarget = allNames(2); 

% distractor penalty
I = imread('blackRimg.png');
position = [0 250];
bImgR = insertText(I, position, string(disPoints), 'TextColor','red', FontSize = 75, BoxColor='black');
bImgd = Screen('MakeTexture',w,bImgR);

% get ready--white +
start = imread("plus.png");
[GRy,GRx] = size(start);
getReady = Screen('MakeTexture', w, start);
maxY = height - shift; % all of the screen

subject = []; 
allPoints = nan(maxTrials,36); % create base array for points, with 36 being max touches in a trial
allRt = nan(maxTrials,36);
allTouched = nan(maxTrials,36);
global allDimen
allDimen = [];

maxE = 1;

writecell({"Touched Images"}, fileName, 'Sheet', 1, 'Range', 'A1')
writecell({"Points"}, fileName, 'Sheet', 2, 'Range', 'A1')
writecell({"RT"}, fileName, 'Sheet', 3, 'Range', 'A1')
writecell({"pos_log"}, fileName, 'Sheet', 4, 'Range', 'A1')
writecell({"trial_log"}, fileName, 'Sheet', 5, 'Range', 'A1')


%%%%%%%%%%%%%%%%%%
%%INSTRUCTIONS%%%%
%%%%%%%%%%%%%%%%%%
CenterText2(w, 'In this task, you will see 36 cartoon faces on the screen.', [255 255 255], [], shift-40)
CenterText2(w, 'Tap on two or three target faces quickly and accurately.', [255 255 255], [], shift)
CenterText2(w, 'Tap to continue.', [255 255 255], [], shift+40)
Screen('Flip',w)
[xc,yc, responded] = getTouchPoint(dev, w);
while not(responded)
    [xc,yc, responded] = getTouchPoint(dev, w);
end

CenterText2(w, 'Right before the 36 cartoon faces appear, two faces will appear.', [255 255 255], [], shift-100)
CenterText2(w, 'These are the two target faces you are looking for.', [255 255 255], [], shift-60)
CenterText2(w, 'Which two faces you are looking for will vary across searches.', [255 255 255], [], shift-20)
CenterText2(w, 'Both target faces will be present during the trial.', [255 255 255], [], shift+20)
CenterText2(w, 'There may be two of the same target faces.', [255 255 255], [], shift+60)
CenterText2(w, 'Tap anywhere to practice the task.', [255 255 255], [], shift+100)
Screen('Flip',w)
[xc,yc, responded] = getTouchPoint(dev, w);
while not(responded)
    [xc,yc, responded] = getTouchPoint(dev, w);
end
global npPractice
npPractice = true;

trialCount = 0;
noScoreCount = 7; 
t0 = clock; 
for indexPosLog = 1:maxTrials % for each trial
    pr2 = false;
    if indexPosLog > 4
        npPractice = false;
    end
    if indexPosLog < 8 && indexPosLog > 4
        pr2 = true;
    end
    if indexPosLog == 5
        pr2 = true;
        CenterText2(w, 'In the task, you will earn points when you touch a target quickly.', [255 255 255], [], shift-60)
        CenterText2(w, 'The faster you touch a target, the more points you will earn.', [255 255 255], [], shift-20)
        CenterText2(w, 'One target faces is also worth 10 times more than the rest.', [255 255 255], [], shift+20)
        CenterText2(w, 'Tap anywhere to continue.', [255 255 255], [], shift+60)
        Screen('Flip',w)
        [xc,yc, responded] = getTouchPoint(dev, w);
        while not(responded)
            [xc,yc, responded] = getTouchPoint(dev, w);
        end

        CenterText2(w, 'Touching a non-target face results in you losing points.', [255 255 255], [], shift-60)
        CenterText2(w, 'Some non-target faces are larger and move around to distract you.', [255 255 255], [], shift-20)
        CenterText2(w, 'Your task is to try to earn as many points as you can.', [255 255 255], [], shift+20)
        CenterText2(w, 'Tap anywhere to practice the full task.', [255 255 255], [], shift+60)
        Screen('Flip',w)
        [xc,yc, responded] = getTouchPoint(dev, w);
        while not(responded)
            [xc,yc, responded] = getTouchPoint(dev, w);
        end
    end

    if indexPosLog == 8
        allPoints = nan(maxTrials,36);
        CenterText2(w, 'Now the actual task will begin.', [255 255 255], [], shift-60)
        CenterText2(w, 'Your points will start at zero.', [255 255 255], [], shift-20)
        CenterText2(w, 'Try to earn maximum points before your time runs out', [255 255 255], [], shift+20)
        CenterText2(w, 'Tap anywhere to begin the task.', [255 255 255], [], shift+60)
        Screen('Flip',w)
        [xc,yc, responded] = getTouchPoint(dev, w);
        while not(responded)
            [xc,yc, responded] = getTouchPoint(dev, w);
        end

    end

    if round(etime(clock, t0)) >= totalTime*60
        break
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% draw targets %%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if rem(indexPosLog,breakTrial) == 0
    
        CenterText2(w, 'Take a break.', [255 255 255], [], shift-80)
        CenterText2(w, 'The experiment will resume in 30 seconds.', [255 255 255], [], shift-40)
        Screen('Flip',w)
        WaitSecs(paTime)
     
    end
    
    global target_col2 target_col3 
    target_col2 = maxTrials + indexPosLog;
    target_col3 = maxTrials * 2 + indexPosLog;
    targets = [allNames(trial_log(target_col2)), allNames(trial_log(target_col3))];
    unShuffletargetIds = [trial_log(target_col2), trial_log(target_col3)];
    targetIds = unShuffletargetIds(randperm(length(unShuffletargetIds)));
    
    imageYval1 = sz1(3*targetIds(1)-2);
    imageXval1 = sz1(3*targetIds(1)-1);
    x1t = width/4-imageXval1/2;
    y1t = height/2-imageYval1/2+shift;
    x1b = width/4+imageXval1/2;
    y1b = height/2+imageYval1/2+shift;

    imageYval2 = sz1(3*targetIds(2)-2);
    imageXval2 = sz1(3*targetIds(2)-1);
    x2t = 3*width/4-imageXval2/2;
    y2t = height/2-imageYval2/2+shift;
    x2b = 3*width/4+imageXval2/2;
    y2b = height/2+imageYval2/2+shift;
    
    updateTotalPoints(allPoints, I);
    Screen('DrawTexture',w,Pict(targetIds(1)), [], [x1t y1t x1b y1b]);
    Screen('DrawTexture',w,Pict(targetIds(2)), [], [x2t y2t x2b y2b]);
    Screen('Flip', w);
    WaitSecs(1.5)

    % draw get ready--1+ 100x100 pixel 
    updateTotalPoints(allPoints, I);
    sGR = 70;
    Screen('DrawTexture',w, getReady, [], [(width-sGR)/2 (height-sGR)/2+shift (width+sGR)/2 (height+sGR)/2+shift]);  
    
    Screen('Flip', w);
    WaitSecs(1.1)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% draw 36 images per pos_log %%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global bounds eachTrial centerCoorL currentMadeTextures
    bounds = []; % all dimensions 
    centerCoorL = []; 
    
    currentMadeTextures = [];
    eachTrial = pos_log(indexPosLog,1:end);
    for indexImgId = 1:length(eachTrial) 
        eachImgId = eachTrial(indexImgId); % between 1-14, the particular image
        
        posNum = find(posArr == indexImgId); % 1d index of grid, counting by box in column
        col = floor((posNum-1)/numRows)+1;
        row = posNum-(col-1)*numRows; 

        dimen = randShift(row, col, eachImgId);
        allDimen = [allDimen, dimen];
        Screen('DrawTexture',w,Pict(eachImgId), [], dimen);
       
        currentMadeTextures = [currentMadeTextures, Pict(eachImgId)];
    end


   if npPractice == false
   updateTotalPoints(allPoints, I);
   end

    global pointsTrial
    currentImgs = eachTrial; %list of current image ids that are untouched
    timeStart = GetSecs; % start response timer
    pointsTrial = []; % points per round
    rtTrial = [];
    touchedimgsTrial = strings(1,0);
    subject = [];
    
    global bPos sPos
    bPos = 1;
    sdistractor = 0;
    if ismember(5, eachTrial) || ismember(6, eachTrial)
        [sdistractor] = distractorInfo(posArr);
    end
    
    n = 0; % num attempts to hit all targets, max is 36
    finished = false;
    global numMove
    numMove = 0;
    overtime = false;

    while not(finished) && n<=36
        n = n+1;
        refreshT = false;
        responded = 0;

        while responded==0 && c < 1000  && not(overtime)% no touch
            c = c+1;
             flick = false;
             if sdistractor > 0
                if currentMadeTextures(bPos) == Pict(sdistractor)
                   flick = true;
                end
             end
            global step
            step = 5;
            [xT,yT, responded] = getTouchWithFlicker(dev,w,flick, allPoints,I);
            if GetSecs-timeStart >= mtimeRound+2
                overtime = true;
            end

        end
        if overtime
            break 
        end
        if responded == 0 && not(overtime)
            Screen('Close');
            quit cancel;
        end

        if xT > 0 && yT > 0
            [touched, touchedIndex] = touchedWhich(xT,yT, allNames, touchedimgsTrial);
            if touchedIndex > 0
            
            touchedimgsTrial = [touchedimgsTrial, touched];
            subject = [subject, answer];
            rtNow = GetSecs - timeStart; 
            rtTrial = [rtTrial, string(rtNow)];
             if npPractice == true
            
                if ismember(touched,targets) % touched target
                    % target bonus
                    debug_log(strcat('high val target:', highValTarget))
                    if touched == highValTarget % high value, larger font & points 
                        bImgG = insertText(I, position, "Correct!", 'TextColor','green', FontSize = 120, BoxColor='black');
                    else
                        bImgG = insertText(I, position, "Correct!", 'TextColor','green', FontSize = 75, BoxColor='black');
                    end
                    bImgi = Screen('MakeTexture',w,bImgG);
                    currentMadeTextures(touchedIndex) = bImgi; 
         
                else %touched distractor/filler
                    if currentMadeTextures(touchedIndex) ~= bImgd
                        pointsTrial = [pointsTrial, disPoints];
                        %currentMadeTextures(touchedIndex) = bImgd; 
                        bImgDis = insertText(I, position, "Oops!", 'TextColor','red', FontSize = 75, BoxColor='black');
                        bImgdN = Screen('MakeTexture',w,bImgDis);
                        currentMadeTextures(touchedIndex) = bImgdN; 
                    end
                end   
                        currentImgs(touchedIndex) = 0;

            else % NO PRACTICE
                 if ismember(touched,targets) % touched target
                    [turnPoints, pointsTouch] = targetPoints(rtNow, touched, trialCount);            
                    
                    % target bonus
                    debug_log(strcat('no practice, hvt:', highValTarget))
                    if touched == highValTarget % high value, larger font & points 
                        bImgG = insertText(I, position, turnPoints, 'TextColor','green', FontSize = 120, BoxColor='black');
                        debug_log(strcat('touched target', touched))
                    else
                        bImgG = insertText(I, position, turnPoints, 'TextColor','green', FontSize = 75, BoxColor='black');
                    end
                    bImgi = Screen('MakeTexture',w,bImgG);
                    currentMadeTextures(touchedIndex) = bImgi; 
         
                 else %touched distractor/filler
                        if currentMadeTextures(touchedIndex) ~= bImgd
                            pointsTrial = [pointsTrial, disPoints];
                            currentMadeTextures(touchedIndex) = bImgd;      
                        end
                 end
                    currentImgs(touchedIndex) = 0;
            end

            %check if done
            if sum(ismember(targetIds,currentImgs)) == 0
                finished = true;
            end
        
            % redraw images 
            for i = 1:length(bounds)/4
               dim = bounds(4*(i-1)+1:4*i); 
               Screen('DrawTexture',w,currentMadeTextures(i), [], [dim(1) dim(2) dim(3) dim(4)]);   
            end
            Screen('Flip', w);

        if not(npPractice) 
            for eachPointIndex = 1:length(pointsTrial) 
                allPoints(indexPosLog,eachPointIndex) = pointsTrial(eachPointIndex);
                if not(pr2)
                    allRt(indexPosLog,eachPointIndex) = rtTrial(eachPointIndex);
                    allTouched(indexPosLog,eachPointIndex) = find(allNames == touchedimgsTrial(eachPointIndex)); % indexes of touched imgs
                end
            end
        end
        updateTotalPoints(allPoints, I);
       
        
       

        updateTotalPoints(allPoints, I);
        if finished
            WaitSecs(1)
        end
        Screen('Flip', w);

        end
        end
%         WaitSecs(1) % see last touch points   
    end
    if not(pr2) && not(npPractice) 
        shifter = 7; % 7 practice trials + 1 for current
        trialCount = trialCount + 1;

        a=allTouched(indexPosLog,:);
        l = length(a);
        startcell = strcat('A',string(trialCount+1));
        endcell = strcat(excelAlpha(size(a,2)),string(trialCount+1));
        r1 = strcat(strcat(startcell,':'), endcell);
        writematrix(a,fileName, 'Sheet', 1, 'Range', r1);
        
        a=allPoints(indexPosLog,:);
        l = length(a);
        startcell = strcat('A',string(trialCount+1));
        endcell = strcat(excelAlpha(size(a,2)),string(trialCount+1));
        r2 = strcat(strcat(startcell,':'), endcell);
        writematrix(a,fileName, 'Sheet', 2, 'Range', r2);
        
        a=allRt(indexPosLog,:);
        l = length(a);
        startcell = strcat('A',string(trialCount+1));
        endcell = strcat(excelAlpha(size(a,2)),string(trialCount+1));
        r3 = strcat(strcat(startcell,':'), endcell);
        writematrix(a,fileName, 'Sheet', 3, 'Range', r3);
        
        a=pos_log(indexPosLog,:);
        l = length(a);
        startcell = strcat('A',string(trialCount+1));
        endcell = strcat(excelAlpha(size(a,2)), string(trialCount+1));
        r4 = strcat(strcat(startcell,':'), endcell);
        writematrix(a,fileName, 'Sheet', 4, 'Range', r4);
        
        a=trial_log(indexPosLog,:);
        l = length(a);
        startcell = strcat('A',string(trialCount+1));
        endcell = strcat(excelAlpha(size(a,2)), string(trialCount+1));
        r5 = strcat(strcat(startcell,':'), endcell);
        writematrix(a,fileName, 'Sheet', 5, 'Range', r5);
    end
    

%%%--------
end

Screen('CloseAll')


if trialCount<=16 && trialCount>=7
    if nnz(~isnan(allPoints(trialCount,:)))>= maxE
        maxE = nnz(~isnan(allPoints(trialCount,:)));
    end
end


maxE = maxE +1;

%%%%%%%%%%%%%%%
%% Save Data %%
%%%%%%%%%%%%%%%
% 
% 
maxE = maxE+2;
for i = 1:14
    writecell({string(i)}, fileName, 'Sheet', 1, 'Range', strcat(string(excelAlpha(1,maxE+2)),string(i)))
    writecell({allNames(i)}, fileName, 'Sheet', 1, 'Range', strcat(string(excelAlpha(1,maxE+3)),string(i)))
end



% write total points
fprintf(pointFile, strcat('Total Points =', {' '}, string(tsnansum(allPoints,'all'))));
% cd...

fclose(pointFile);

function[] = debug_log(str)
     fileId = fopen('logfile.txt', 'a+');
     fprintf(fileId, '%s \n', str);
     fclose(fileId);
end
function[] = save_data(str)
    dID = fopen(strcat(subjno_Str,'_data.txt'), 'a+');
    fprintf(dID, '%s \n', str);
    fclose(dID);
end

function outList = shufflePartly(inList)
    first = inList(1:4);
    last = inList(5:length(inList));
    shuffledFirst = first(randperm(length(first))); 
    outList = [shuffledFirst, last]; 
end

function[newImg] = myResize(img, width, height)
    global sz1 numRows numColumns   
    sx = size(img,2); % pict's initial x size
    sy = size(img,1); % initial y size
    scaleX = width/numRows/sx*2/3; % converted to 2/3 of max size for more shifting
    scaleY = height/numColumns/sy*2/3;
    %% resize images
    if scaleX < scaleY
        newImg = imresize(img, scaleX);
    else
        newImg = imresize(img, scaleY);
    end
    sz1 = [sz1, size(newImg)]; % update resized list
end

function[numColoredPix] = countNumColorPix(img)
   allPixColor = (max(img,[],3) > 10);
  % allPixColor = allPixColor .* sum(img,3);
   numColoredPix = sum(allPixColor, 'all');
end

function[finImg] = pixelResize(standardColoredPix, img, standardMeanS, standardMeanV, mscale)
   global sz1 
   % resize per num colored pixels
   numColoredPix = countNumColorPix(img); 
   pscale = (double(standardColoredPix)/double(numColoredPix)).^(1/2) * mscale;
   rezImg = imresize(img, pscale);
   
   % change per saturation scale with toad
   pixImg = double(rezImg);
   [currentMeanS, currentMeanV] = saturation(pixImg);
   sHSVScale = double(standardMeanS)/double(currentMeanS);
   vHSVScale = double(standardMeanV)/double(currentMeanV);

   sFactor = .5;
   sScale = 1 * (1-sFactor) + sHSVScale*sFactor + .2; % min scaling is 1, max is HSV scale, + additional saturation
   
   lFactor = 1;
   lScale = 1 * (1-lFactor) + vHSVScale*lFactor + .2; % min scaling is 1, max is HSV scale, + additional saturation

   finImg = imtweak(pixImg/255,'hsv',[0 sScale lScale])*255;

   sz1 = [sz1, size(finImg)];
end

function[medianS, medianV] = saturation(newImg) 
   newImgD = double(newImg);

   R = newImg(:,:,1);
   G = newImg(:,:,2);
   B = newImg(:,:,3);
  
   H = max(newImgD,[],3) - min(newImgD,[],3) ;
   V = max(newImgD,[],3);
   S = H/V;
   medianS = median(S(find(S>.1)), "all");
   medianV = median(V(find(V>.1)), "all");
end

function dim = randShift(row,col, pictNum)
  global width height numRows numColumns sz1 bounds centerCoorL shift
  % center of each screen section
  cy0 = (row-1) * (height/numColumns) + height/(2*numRows) + shift;
  cx0 = (col-1) * (width/numRows) + width/(2*numColumns);
  centerCoorL = [centerCoorL, cx0, cy0];
global index
  index = pictNum-1;
  % coordinates for images centered in each screen section
  topLeftY = cy0 - sz1(3*index + 1)/2;
  topLeftX = cx0 - sz1(3*index + 2)/2;
  botRightY = cy0 + sz1(3*index + 1)/2;
  botRightX = cx0 + sz1(3*index + 2)/2;
  
  %% randomly shift image within screen section
  ay = cy0 - height/(2*numRows); % minimum top left y value for img 
  Y1 = ay + (topLeftY-ay) * rand(); % top y val
  Y2 = Y1 + sz1(3*index + 1); % bottom y val

  ax = cx0 - width/(2*numColumns); % minimum top left x value for img 
  X1 = ax + (topLeftX-ax) * rand(); % top x val
  X2 = X1 + sz1(3*index + 2); % bottom x val

  dim = [X1 Y1 X2 Y2];
  bounds = [bounds, [X1 Y1 X2 Y2]];
end

function[sdistractor] = distractorInfo(posArr)
 global eachTrial bPos sPos   
    if ismember(5, eachTrial)
        sdistractor = 5;
    else
        sdistractor = 6;
    end
    sPos = find(posArr == find(eachTrial == sdistractor)); % num loc vert. counting
    
    slocy = mod(sPos,6);
    slocx = floor(sPos/6)+1;

    bPos = posArr(slocy,slocx);
end


function[] = flickerDistractor() %step = +/-1 pix   
    global bounds w currentMadeTextures dim  index bPos numMove step
    % redraw images with flickering salient distractor

    for i = 1:length(bounds)/4
         index = 4*(i-1)+1:4*i;
       if i==bPos
            bounds(index(1)) = bounds(index(1)) + step;
            bounds(index(3)) = bounds(index(3)) + step;
            maxmove = 8;
            if step > 0
                 numMove = numMove+1;
                 if numMove > maxmove
                     step = -abs(step);
                end
            else
                numMove = numMove -1;
                 if numMove < -maxmove
                    step = abs(step);
                 end
            end
       end
     
       dim = round(bounds(index)); 
       Screen('DrawTexture',w,currentMadeTextures(i), [], [dim(1) dim(2) dim(3) dim(4)]);   
  end
end


function[] = updateTotalPoints(allPoints, I)
global w width height shift npPractice 
if npPractice == false
    totalP = round(tsnansum(allPoints,'all'));
%     test:
%   totalP = totalP*10e10
    charPoints = addComma(totalP); 


% %%%% Re-assign text style? 
oldfont=Screen('TextFont', w, 'Arial');
oldsize=Screen('TextSize', w, 40);  
oldstyle=Screen('TextStyle', w, 1); 

CenterText2(w, charPoints, [255 255 255], [], 1-height/2)
    
end
end
function numOut = addComma(numIn)
    jf = java.text.DecimalFormat;
    numOut = char(jf.format(numIn));
end
function [x,y, responded] = getTouchPoint(dev,w)    
    TouchQueueStart(dev); % begin getting touch
    responded = 0;
    x = 0;
    y = 0;
    evt = TouchEventGet(dev, w, .7); 
    if ~isempty(evt) % if touched, get x and y coordinates of touch
        x = evt.X; 
        y = evt.Y;
        responded = 1; % update responded
    end
    TouchEventFlush(dev);
    TouchQueueStop(dev);
end


function [x,y, responded] = getTouchWithFlicker(dev,w,flick, allPoints,I)  
    global bPos 
    TouchQueueStart(dev); % begin getting touch
    responded = 0;
    x = 0;
    y = 0;
    evt = TouchEventGet(dev, w, .05); 
    while isempty(evt)
        if flick
            flickerDistractor()
        else
            drawNonFlick()
        end
        updateTotalPoints(allPoints, I);
        Screen('Flip',w)
        evt = TouchEventGet(dev, w, .05); 
    end
    if ~isempty(evt) % if touched, get x and y coordinates of touch
        x = evt.X; 
        y = evt.Y;
        responded = 1; 
    end
    TouchEventFlush(dev);
    TouchQueueStop(dev);
end

function []= drawNonFlick()
global bounds w currentMadeTextures dim index
    for i = 1:length(bounds)/4
        index = 4*(i-1)+1:4*i;
       dim = round(bounds(index)); 
       Screen('DrawTexture',w,currentMadeTextures(i), [], [dim(1) dim(2) dim(3) dim(4)]);   
    end
end

function [touched,indexTouched] = touchedWhich(x,y, allNames, touchedimgsTrial)
    global centerCoorL numColumns numRows width height eachTrial fileId
    for set = 1:length(centerCoorL)/2 % loop through each image
        % get centers and top of each box/division of screen/image slot 
        xcenter = centerCoorL(2*set-1);
        ycenter = centerCoorL(2*set);
        leftX = xcenter - width/(2*numColumns); % left most x value for img
        rightX = xcenter + width/(2*numColumns);
        topY = ycenter - height/(2*numRows); %  top y value for img
        botY = ycenter + height/(2*numRows);

        touched = strings();
        indexTouched = 0;
        cimage = allNames(eachTrial(set)); 

       if (x >= leftX && x <= rightX && y >= topY && y <= botY) % touched a particular picture 
            touched = cimage; % name of touched img
            indexTouched = set;
            break;
       end
    end
end

function [turnPoints, pointsTrial] = targetPoints(rtNow, touched, trialCount)

    global pointsTrial target_col2 target_col3 mtimeRound trial_log allNames 
    time = mtimeRound*1000;
    baseP = round((mtimeRound-rtNow)*100); % centiseconds, no x10  

%%%%%%%%%%!!!!!!!!!!!!
%     baseP = round((mtimeRound-rtNow)*10000000); % centiseconds, no x10  
%%%%%%%%%%!!!!!!!!!!!!

    rowAfterShift = trialCount+7;
    if rtNow >= mtimeRound % too slow to get points
        turnPoints = '+0';
        pointsTrial = [pointsTrial, 0];      
    else %  earned points
        touchedID = find(touched==allNames);

        if touchedID==2
%               debug_log("high val target")
                turnPoints = '+' + string(10*baseP);
                pointsTrial = [pointsTrial, 10*baseP];
        else
            turnPoints = '+' + string(baseP);
            pointsTrial = [pointsTrial, round(baseP)];
        end
    end
end


