; --------------------------------------------------
; This script generates the demo svg
; --------------------------------------------------
#SingleInstance Force
SetkeyDelay 0, 50

; NOTE: This should be executed in the offline/demo folder

Return

Type(Command, Delay=2000) {
  Send % Command
  Sleep 500
  Send {Enter}
  Sleep Delay
}

F12::
  Type("rm -rf myjobs")
  Type("termtosvg cast.svg -t window_frame_js")

  Type("jobly", 5000)
  Type("{#} Create a minimal jobs workspace", 500)
  Type("jobly init myjobs --minimal", 4000)

  Type("cd ./myjobs")
  Type("tree")
  Type("vimcat jobs/ping.rb")

  Type("{#} Run the job directly (no server)", 500)
  Type("jobly run Ping", 4000)

  Type("{#} ... or with arguments", 500)
  Type("jobly run Ping response:Bling", 4000)

  Type("{#} Start the job server and worker (in the background)", 500)
  Type("nohup jobly server &>/dev/null &")
  Type("nohup jobly worker &>/dev/null &")

  Type("{#} Run the job on the server using the CLI", 500)
  Type("jobly send Ping", 4000)

  Type("{#} Run the job on the server using the API", 500)
  Type("curl http://localhost:3000/do/Ping", 2500)

  Type("{#} ... or with arguments", 500)
  Type("curl http://localhost:3000/do/Ping?response=ThankYou", 2500)

  Type("exit")
  Type("pkill ruby")
  Type("pkill sidekiq")
Return

^F12::
  Reload
return

^x::
  ExitApp
return
