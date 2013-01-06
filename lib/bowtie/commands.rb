require 'commands/command'
%w{name env new_project_generator start console 
   app_generator app_destroyer model_generator
   model_destroyer}.each do |file|
  require "commands/#{file}_command"
end