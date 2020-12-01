-module(file_reading).
-export([reading/1,readlines/1,get_all_lines/2]).

reading(FileName) ->
 Lines =readlines(FileName),
 io:format("~s~n",[Lines]).
readlines(FileName) ->
    {ok, Device} = file:open(FileName, [read]),
    get_all_lines(Device, []).

get_all_lines(Device, Accum) ->
    case io:get_line(Device, " ") of
        eof  -> file:close(Device), Accum;
        Line -> get_all_lines(Device, Accum ++ [Line])
    end.
