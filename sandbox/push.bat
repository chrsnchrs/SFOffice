@echo


call sfdx force:source:convert -d deploy
call sfdx force:mdapi:deploy -d deploy -u christianc@magnumia.com.train -w 10
if [%~1]==[] goto end
call sfdx force:apex:test:run -n %1 -r human -d TestResults -u christianc@magnumia.com.train

:end