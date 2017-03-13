classdef CEA < handle

    properties (SetAccess = public)
        data;
        ioinp;
        input;
    end
    
    methods 
        function this = CEA()
            this.input = input_class(this);
        end
        function data = run(obj,inputFile)
            currentpath = which('CEA.m');
            [pathstr,~,~] = fileparts(currentpath);
            if ismac
                inputFile = strcat('/',inputFile);
            elseif isunix
                inputFile = strcat('/',inputFile);
            elseif ispc
                inputFile = strcat('\',inputFile);
            else
                error('Platform not supported')
            end  
            data = cea2(inputFile,pathstr);
            obj.data
            return;
        end
%         function input = rocket(obj, OF,pressure,presUnit, supar, PcPe, fuel, fuelWt, fuelTemp, oxid, oxidWt, oxidTemp)
%             % examples
%             % input = test.rocket( 3 , 350, 'psia', 4.84 , 23.8 , 'paraffin' , 100, 298.15 , 'N2O', 100, 298.15)
%             % input = test.rocket( 3 , 350 ,'psia', 4.84 , 23.8 , {'paraffin' 'CH4' 'RP-1'} , [50 25 25], [298.15 298.15 298.15], {'N2O' 'O2(L)'}, [75 25],[298.15 90.1])
%             input = sprintf('prob case=wrapper ro equilibrium');
%             input = strcat(input,sprintf('\n\n ! iac problem'));
%             input = strcat(input,sprintf('\no/f %g',OF));   %oxidiser to fuel ratio
%             input = strcat(input,sprintf('\np,%s  %g',presUnit,pressure)); %pressure
%             input = strcat(input,sprintf('\nsupar %g',supar));  %supersonic area ratio
%             input = strcat(input,sprintf('\npip %g',PcPe));    %Pc/Pe
%             input = strcat(input,sprintf('\nreac'));
%             if length(fuelWt)>1
%                 for i = 1:length(fuelWt)
%                     input = strcat(input,sprintf('\n  fuel  %s wt%%=%6.3f t,k=%6.2f',fuel{i},fuelWt(i),fuelTemp(i)));
%                 end
%             else
%                 input = strcat(input,sprintf('\n  fuel  %s wt%%=%g. t,k=%6.2f',fuel,fuelWt,fuelTemp));
%             end
%             if length(oxidWt)>1
%                 for i = 1:length(oxidWt)
%                     input = strcat(input,sprintf('\n  oxid  %s wt%%=%6.3f t,k=%6.2f',oxid{i},oxidWt(i),oxidTemp(i)));
%                 end
%             else
%                 input = strcat(input,sprintf('\n  oxid  %s wt%%=%g. t,k=%6.2f',oxid,oxidWt,oxidTemp));
%             end
%             input = strcat(input,sprintf('\noutput    short'));
%             input = strcat(input,sprintf('\noutput trace=1e-5'));
%             input = strcat(input,sprintf('\nend'));
%             
%             obj.input = input;
%             return;
%         end

    end
    
end