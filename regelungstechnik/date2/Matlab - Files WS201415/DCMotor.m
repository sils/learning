% function [ w ] = DCMotor( u,ni_obj )
% %UNTITLED4 Summary of this function goes here
% 
% %umotor = 2.5*(1 - u/10);
% umotor = u;
% ni_obj.outputSingleScan(umotor);
% 
% data = ni_obj.inputSingleScan();
% w = data(1);
% 
% end
function DCMotor(block)
% Level-2 MATLAB file S-Function for DC Motor.

  setup(block);
  
%endfunction

function setup(block)
  
  block.NumDialogPrms  = 1;
  
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 1;

  %% Setup functional port properties to dynamically
  %% inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
 
  block.InputPort(1).Dimensions        = 1;
  block.InputPort(1).DirectFeedthrough = false;
 
  block.OutputPort(1).Dimensions       = 4;
  
  %% Set block sample time to inherited
  block.SampleTimes = [0 0];
  
  %% Set the block simStateCompliance to default (i.e., same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';

  %% Register methods
  block.RegBlockMethod('InitializeConditions',    @InitConditions);  
  block.RegBlockMethod('Outputs',                 @Output);  
  block.RegBlockMethod('Update',                  @Update);  
  
%endfunction

% function DoPostPropSetup(block)
% 
%   %% Setup Dwork
%   block.NumDworks = 1;
%   block.Dwork(1).Name = 'x0'; 
%   block.Dwork(1).Dimensions      = 1;
%   block.Dwork(1).DatatypeID      = 0;
%   block.Dwork(1).Complexity      = 'Real';
%   block.Dwork(1).UsedAsDiscState = true;
% 
% %endfunction

function InitConditions(block)

  %% Initialize Dwork
  
%endfunction

function Output(block)

ni_obj = block.DialogPrm(1).Data;
NIdata = ni_obj.inputSingleScan();

%w_offs = block.DialogPrm(2).Data;
%block.OutputPort(1).Data = NIdata(1) - w_offs;
block.OutputPort(1).Data = NIdata;
  
%endfunction

function Update(block)

ni_obj = block.DialogPrm(1).Data;
u = block.InputPort(1).Data;
%umotor = 2.5*(1 - u/10);
ni_obj.outputSingleScan(u);
  
%endfunction
