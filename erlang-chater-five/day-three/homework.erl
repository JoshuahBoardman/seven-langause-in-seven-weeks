-module(homework).
-export([monitor/0, translater/0, translate/2, doc/0, roulette/0, monitor_doc/0]).

% Assignment One:
monitor() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(translater, spawn_link(fun homework:translater/0)),
            monitor();
        {'EXIT', From, Reason} ->
            io:format("The process ~p died with reason ~p.", [From, Reason]),
                        io:format(" Restarting. ~n"),
            self() ! new,
            monitor()
        end.
 
translater() ->
    receive
        {From, "casa"} ->
            From ! "house",
            translater();
        {From, "blanca"} ->
            From ! "white",
            translater();
        {From, _} ->
            From ! "I don't understand.",
            translater()
end.

translate(To, Word) ->
    To ! {self(), Word},
    receive
        Translation -> Translation
    end.

% Assignment Two:
% Dont fully understand the question for this one.
doc() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(revolver, spawn_link(fun homework:roulette/0)),
            doc();
        {'EXIT', From, Reason} ->
            io:format("The shooter ~p died with reason ~p.", [From, Reason]),
                        io:format(" Restarting. ~n"),
            self() ! new,
            doc()
        end.

roulette() ->
    receive
        3 -> io:format("bang.~n"), exit({roulette,die,at,erlang:time()});
        _ -> io:format("click~n"), roulette()
end.

monitor_doc() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring doctor.~n"),
            register(doctor, spawn_link(fun homework:doc/0)),
            monitor_doc();
        {'EXIT', From, Reason} ->
            io:format("The doctor ~p died with reason ~p.", [From, Reason]),
                        io:format(" Restarting. ~n"),
            self() ! new,
            monitor_doc()
    end.   

% Assignment Three:
