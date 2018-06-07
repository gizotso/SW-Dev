:: use this file to run your own startup commands
:: use  in front of the command to prevent printing the command

:: call "%GIT_INSTALL_ROOT%/cmd/start-ssh-agent.cmd"
:: set "PATH=%CMDER_ROOT%\vendor\whatever;%PATH%"

::call T:\PortableApps\Scripts\set_env.cmd
call %~d0\PortableApps\Scripts\set_env.cmd