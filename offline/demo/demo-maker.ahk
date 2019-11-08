; --------------------------------------------------
; This script generates the demo svg
; --------------------------------------------------
#SingleInstance Force
SetkeyDelay 0, 10

Commands := []
Index := 1

; NOTE: This should be executed in the offline/demo folder

; Commands.Push("rm -rf myjobs {;} rm cast.json {;} asciinema rec cast.json")
Commands.Push("rm -rf myjobs {;} rm cast.json {;} termtosvg cast.svg -t window_frame_js")

Commands.Push("jobly")

Commands.Push("{#} Create a minimal jobs workspace")
Commands.Push("jobly init myjobs --minimal")

Commands.Push("cd ./myjobs")
Commands.Push("tree")
Commands.Push("cats jobs/ping.rb")

Commands.Push("{#} Run the job directly (no server)")
Commands.Push("jobly run Ping")

Commands.Push("{#} ... or with arguments")
Commands.Push("jobly run Ping response:Bling")

Commands.Push("{#} Start the job server and worker (in the background)")
Commands.Push("nohup jobly server &>/dev/null &")
Commands.Push("nohup jobly worker &>/dev/null &")

Commands.Push("{#} Run the job on the server using the CLI")
Commands.Push("jobly send Ping")

Commands.Push("{#} Run the job on the server using the API")
Commands.Push("curl http://localhost:3000/do/Ping")

Commands.Push("{#} ... or with arguments")
Commands.Push("curl http://localhost:3000/do/Ping?response=ThankYou")

Commands.Push("exit")
; Commands.Push("cat cast.json | svg-term --out cast.svg --window")

F12::
  Send % Commands[Index]
  Index := Index + 1
return

^F12::
  Reload
return

^x::
  ExitApp
return
