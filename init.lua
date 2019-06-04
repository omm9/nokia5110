-- load credentials, 'SSID' and 'PASSWORD' declared and initialize in there
-- dofile("credentials.lua")

function startup()
    if file.open("init.lua") == nil then
        print("init.lua deleted or renamed")
    else
        print("Running")
        file.close("init.lua")
        -- the actual application is stored in 'application.lua'
         dofile("application.lua")
    end
end

  print("10 secs to abort.")
  print("Waiting...") 
  tmr.create():alarm(10000, tmr.ALARM_SINGLE, startup)