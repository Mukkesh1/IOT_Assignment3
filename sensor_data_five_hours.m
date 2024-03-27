readAPIKey = 'YP2S7TANN1WXVT11';  
channelID = 2483177;

endDate = datetime('now', 'TimeZone', 'UTC');
startDate = endDate - hours(5);

[temperatureData, tempTimeStamps] = thingSpeakRead(channelID, 'Field', 1, 'DateRange', [startDate, endDate], 'ReadKey', readAPIKey);
if isempty(temperatureData)
    fprintf('\nNo Temperature data was published in the last five hours.\n');
else
    fprintf('\nTemperature Data:\n');
    for i = 1:length(temperatureData)
        fprintf('%s: %f\n', datestr(tempTimeStamps(i)), temperatureData(i));
    end
    fprintf('\n');
end

[humidityData, humidityTimeStamps] = thingSpeakRead(channelID, 'Field', 2, 'DateRange', [startDate, endDate], 'ReadKey', readAPIKey);
if isempty(humidityData)
    fprintf('No Humidity data was published in the last five hours.\n');
else
    fprintf('Humidity Data:\n');
    for i = 1:length(humidityData)
        fprintf('%s: %f\n', datestr(humidityTimeStamps(i)), humidityData(i));
    end
    fprintf('\n');
end

[co2Data, co2TimeStamps] = thingSpeakRead(channelID, 'Field', 3, 'DateRange', [startDate, endDate], 'ReadKey', readAPIKey);
if isempty(co2Data)
    fprintf('No CO2 data was published in the last five hours.\n');
else
    fprintf('CO2 Data:\n');
    for i = 1:length(co2Data)
        fprintf('%s: %f\n', datestr(co2TimeStamps(i)), co2Data(i));
    end
    fprintf('\n'); 
end
