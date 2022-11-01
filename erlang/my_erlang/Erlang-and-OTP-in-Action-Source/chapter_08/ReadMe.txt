
## a节点

提供的
{a1, [1,2,3]}

{a2, [4,5,6]}

{a3, [7,8,9]}

目标需要 
[a1,a2, b1,b2, c1,c2]

## b节点提供的
{b1, [11,12,13]}

{b2, [14,15,16]}

{b3, [17,18,19]}

目标需要 
[a2,a3, b2,b3, c2,c3]

## c节点提供的
{c1, [21,22,23]}

{c2, [24,25,26]}

{c3, [27,28,29]}

目标需要 
[a1,a3, b1,b3, c1,c3]



# 写入服务器状态



## 添加各种资源

## a节点
resource_discovery:start_link().
%% 添加需求资源列表
resource_discovery:add_target_resource_type(a1).
resource_discovery:add_target_resource_type(a2).
resource_discovery:add_target_resource_type(b1).
resource_discovery:add_target_resource_type(b2).
resource_discovery:add_target_resource_type(c1).
resource_discovery:add_target_resource_type(c2).

%% 添加本地资源
resource_discovery:add_local_resource(a1,[1,2,3]).
resource_discovery:add_local_resource(a2,[4,5,6]).
resource_discovery:add_local_resource(a3,[7,8,9]).

## b节点

resource_discovery:start_link().
resource_discovery:add_target_resource_type(a2).
resource_discovery:add_target_resource_type(a3).
resource_discovery:add_target_resource_type(b2).
resource_discovery:add_target_resource_type(b3).
resource_discovery:add_target_resource_type(c2).
resource_discovery:add_target_resource_type(c3).
resource_discovery:add_local_resource(b1,[11,12,13]).
resource_discovery:add_local_resource(b2,[14,15,16]).
resource_discovery:add_local_resource(b3,[17,18,19]).

## c节点

resource_discovery:start_link().
resource_discovery:add_target_resource_type(a1).
resource_discovery:add_target_resource_type(a3).
resource_discovery:add_target_resource_type(b1).
resource_discovery:add_target_resource_type(b3).
resource_discovery:add_target_resource_type(c1).
resource_discovery:add_target_resource_type(c3).
resource_discovery:add_local_resource(c1,[21,22,23]).
resource_discovery:add_local_resource(c2,[24,25,26]).
resource_discovery:add_local_resource(c3,[27,28,29]).



## 测试
net_adm:ping('b@centos7-dev').
net_adm:ping('c@centos7-dev').

resource_discovery:trade_resources().
resource_discovery:fetch_resources(a1).



符合预期

(a@centos7-dev)14> resource_discovery:fetch_resources(a1).
{ok,[[1,2,3]]}
(a@centos7-dev)15> resource_discovery:fetch_resources(a2).
{ok,[[4,5,6]]}
(a@centos7-dev)16> resource_discovery:fetch_resources(a3).
error
(a@centos7-dev)17> resource_discovery:fetch_resources(b1).
{ok,["\v\f\r"]}
(a@centos7-dev)18> resource_discovery:fetch_resources(b2).
{ok,[[14,15,16]]}
(a@centos7-dev)19> resource_discovery:fetch_resources(b3).
error

