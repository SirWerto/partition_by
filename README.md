# partition_by


```erlang
1> KVList = [{<<"state">>, <<"active">>}, {<<"view">>, <<"server">>}, {<<"id">>, <<"some_server">>}, {<<"feed">>, <<"raw_snapshot">>}, {<<"date">>, <<"2023-11-14">>}].
[{<<"state">>,<<"active">>},
 {<<"view">>,<<"server">>},
 {<<"id">>,<<"some_server">>},
 {<<"feed">>,<<"raw_snapshot">>},
 {<<"date">>,<<"2023-11-14">>}]

2> Res = partition_by:to_partition(KVList).
<<"state=active/view=server/id=some_server/feed=raw_snapshot/date=2023-11-14">>

3> partition_by:from_partition(Res, <<"=">>).
[{<<"state">>,<<"active">>},
 {<<"view">>,<<"server">>},
 {<<"id">>,<<"some_server">>},
 {<<"feed">>,<<"raw_snapshot">>},
 {<<"date">>,<<"2023-11-14">>}]

```