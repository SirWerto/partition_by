-module(partition_by).

-export([to_partition/1, to_partition/2, from_partition/2]).

-spec to_partition(KVList :: [{binary(), binary()}]) -> binary().
to_partition(KVList) when is_list(KVList) ->
    to_partition(KVList, <<"=">>).

-spec to_partition(KVList :: [{binary(), binary()}], Separator :: binary()) -> binary().
to_partition(KVList, Separator) when is_list(KVList) and is_binary(Separator) ->
    filename:join([<<K/binary, Separator/binary, V/binary>>
                   || {K, V} <- KVList, is_binary(K) and is_binary(V)]).

-spec from_partition(PartitionedPath :: binary(), Separator :: binary()) ->
                        [{binary(), binary()}].
from_partition(PartitionedPath, Separator)
    when is_binary(PartitionedPath) and is_binary(Separator) ->
    [split_and_tuple(S, Separator)
     || S <- filename:split(PartitionedPath), binary:match(S, Separator) =/= nomatch].

split_and_tuple(String, Separator) ->
    [K, V] = binary:split(String, Separator, [trim_all]),
    {K, V}.
