-module(file_writing).
-export([start/1,file_wrt/2]).
-import(file_reading,[reading/1]). #Importing the reading from the file_reading module and I defined in the same main branch.


start(FileName) ->
 io:format("~nReading the contents to the given file line by line: ~s ~n",[FileName]),
 String = io:get_line("Enter a string: "),
 L = [[L] || L <- String ],
 file_wrt(FileName,L),
 file:close(FileName),
 io:format("~nPrinting the contents of the given file: ~s ~n ",[FileName]),
 file_reading:reading(FileName).

file_wrt(FileName,L) ->
 {ok, S} = file:open(FileName, [write,append]),
   lists:foreach(fun(X) -> io:fwrite(S, "~s",[X]) end, L),
    
    file:close(S).
