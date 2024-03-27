readAPIKey = 'YP2S7TANN1WXVT11';  
channelID = 2483177;      

[data, timeStamps, channelInfo] = thingSpeakRead(channelID, 'NumPoints', 1, 'ReadKey', readAPIKey);

disp('Latest Sensor Data Entry:');
disp(['Timestamp: ', datestr(timeStamps)]);

for i = 1:numel(channelInfo.FieldDescriptions)
    fieldDescription = channelInfo.FieldDescriptions{i};
    fieldValue = data(i);
    if ~isempty(fieldDescription)
        fprintf('%s: %f\n', fieldDescription, fieldValue);
    end
end