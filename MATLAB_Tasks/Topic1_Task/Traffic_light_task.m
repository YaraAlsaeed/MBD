function trafficLightGUI()
    % Create the main figure
    fig = uifigure('Name', 'Traffic Light GUI', 'Position', [100, 100, 300, 500]);
    
    % Create axes for drawing
    ax = axes('Parent', fig, 'Position', [0.1, 0.1, 0.8, 0.8], 'Box', 'on', 'XLim', [0, 10], 'YLim', [0, 20]);
    
    % Draw the traffic light outline
    rectangle(ax, 'Position', [3, 2, 4, 16], 'Curvature', [0.2, 0.2], 'FaceColor', [0.7, 0.7, 0.7]);
    
    while true
        % Draw and pause for each light
        drawLight(ax, 5, 16, 'red');
        pause(2);
        
        % Clear the light
        drawLight(ax, 5, 16, 'clear');
        
        % Pause before changing to yellow
        pause(1);
        
        % Draw and pause for each light
        drawLight(ax, 5, 10, 'yellow');
        pause(2);
        
        % Clear the light
        drawLight(ax, 5, 10, 'clear');
        
        % Pause before changing to green
        pause(1);
        
        % Draw and pause for each light
        drawLight(ax, 5, 4, 'green');
        pause(2);
        
        % Clear the light
        drawLight(ax, 5, 4, 'clear');
        
        % Pause before restarting the loop
        pause(1);
    end
end

function drawLight(ax, x, y, color)
    % Draw a light at the specified position and color
    
    % Set the radius of the light
    radius = 1;
    
    % Clear the light if 'clear' is passed as the color
    if strcmp(color, 'clear')
        rectangle(ax, 'Position', [x - radius, y - radius, 2 * radius, 2 * radius], 'Curvature', [1, 1], 'FaceColor', [0.7, 0.7, 0.7]);
        return;
    end
    
    % Draw the light bulb
    rectangle(ax, 'Position', [x - radius, y - radius, 2 * radius, 2 * radius],...
        'Curvature', [1, 1], 'FaceColor', 'k');
    
    % Draw the light color
    switch color
        case 'red'
            lightColor = [1, 0, 0];
        case 'yellow'
            lightColor = [1, 1, 0];
        case 'green'
            lightColor = [0, 1, 0];
        otherwise
            lightColor = [1, 1, 1]; % Default to white if color is not recognized
    end
    
    % Draw the light color as a circle
    rectangle(ax, 'Position', [x - 0.5, y - 0.5, 1, 1],...
        'Curvature', [1, 1], 'FaceColor', lightColor);
end
