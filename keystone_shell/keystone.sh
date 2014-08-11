#!/bin/bash



ADMINTOKEN=5dfb4f98947a6f768ef6032d177f140ec43eea37
HOST=10.120.120.54
#HOST=localhost
set -x


#  create tenants 
echo 'Create tenants admin/service/[demo]:......'
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 tenant-create --name admin
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 tenant-create --name service
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 tenant-create --name demo


# create users
echo 'Create users admin/nova/glance/cinder/[demo], change the --pass value:'

keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-create --name=admin --pass="admin"
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-create --name=cinder --pass="cinder"
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-create --name=glance --pass="glance"
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-create --name=nova --pass="nova"
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-create --name=demo  --pass="demo"

# create roles
echo 'Create roles admin/Member:......'
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 role-create --name=admin
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 role-create --name=Member




# 获取id
function get_id () {
    echo `keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 tenant-list|grep  $1 |awk '{print $2}'`
}

admin_tenant_id=`get_id  admin`
service_tenant_id=`get_id service`
demo_tenant_id=`get_id demo`

echo 'admin_tenant_id:' $admin_tenant_id
echo 'service_tenant_id:' $service_tenant_id
echo 'demo_tenant_id:' $demo_tenant_id
echo


#
#nbs@114-113-199-11:/home/hzsunzixiang$ keystone --os-token $ADMINTOKEN --os-endpoint http://10.120.120.54:35357/v2.0 user-list
keystone --os-token $ADMINTOKEN --os-endpoint http://10.120.120.54:35357/v2.0 user-list

admin_user_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-list|grep admin|awk '{print $2}'`
cinder_user_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-list|grep cinder|awk '{print $2}'`
demo_user_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-list|grep demo|awk '{print $2}'`
glance_user_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-list|grep glance|awk '{print $2}'`
nova_user_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-list|grep nova|awk '{print $2}'`

echo 'admin_user_id:' $admin_user_id
echo 'cinder_user_id:' $cinder_user_id
echo 'demo_user_id:' $demo_user_id
echo 'glance_user_id:' $glance_user_id
echo 'nova_user_id:' $nova_user_id
echo 


admin_role_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 role-list|grep admin|awk '{print $2}'`
demo_role_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 role-list|grep Member|awk '{print $2}'`

echo 'role_id:' $admin_role_id
echo 'demo_role_id:' $demo_role_id
echo 
##nbs@114-113-199-11:/home/hzsunzixiang$ keystone --os-token $ADMINTOKEN --os-endpoint http://10.120.120.38:35357/v2.0 role-list
#
#
##Tenant  User   Roles
##---------------------
##admin   admin  admin
##service cinder admin
##service glance admin
##service nova   admin
##demo    demo   Member
#echo 'Add Roles to Users in Tenants:......'
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-role-add --tenant_id $admin_tenant_id --user_id $admin_user_id --role_id $admin_role_id
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-role-add --tenant_id $service_tenant_id --user_id $cinder_user_id --role_id $admin_role_id
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-role-add --tenant_id $service_tenant_id --user_id $glance_user_id --role_id $admin_role_id
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-role-add --tenant_id $service_tenant_id --user_id $nova_user_id --role_id $admin_role_id
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 user-role-add --tenant_id $demo_tenant_id --user_id $demo_user_id --role_id $demo_role_id



echo 'Create services cinder/glance/keystone/nova:......'
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 service-create --name glance --type image
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 service-create --name nova --type compute
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 service-create --name cinder --type volume
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 service-create --name keystone --type identity


#
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 service-list
nova_service_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 service-list|grep nova|awk '{print $2}'`
cinder_service_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 service-list|grep cinder|awk '{print $2}'`
glance_service_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 service-list|grep glance|awk '{print $2}'`
keystone_service_id=`keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 service-list|grep keystone|awk '{print $2}'`

echo 'nova_service_id:' $nova_service_id
echo 'cinder_service_id:' $cinder_service_id
echo 'glance_service_id:' $glance_service_id
echo 'keystone_service_id:' $keystone_service_id
#
##keystone --os-token ADMINTOKEN --os-endpoint http://localhost:35357/v2.0 service-list
##+----------------------------------+----------+----------+-------------+
##|                id                |   name   |   type   | description |
##+----------------------------------+----------+----------+-------------+
##| 4ffde1c0ac5b4525977fbe8b62c76fc8 |  glance  |  image   |     None    |
##| 73b14a20c76d4dbb82795d9fef1ff70a |   nova   | compute  |     None    |
##| e706729a1b0b416bb45d0ac093caa94e |  cinder  |  volume  |     None    |
##| ef2d6bae19b14943bbf44a7ff23edb44 | keystone | identity |     None    |
##+----------------------------------+----------+----------+-------------+
#
#
echo 'Create endpoints:......'

keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 endpoint-create --region RegionOne --service_id $nova_service_id --publicurl "http://$HOST:8774/v2/\$(tenant_id)s" --adminurl "http://$HOST:8774/v2/\$(tenant_id)s" --internalurl "http://$HOST:8774/v2/\$(tenant_id)s"
#volume
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 endpoint-create --region RegionOne --service_id $cinder_service_id --publicurl "http://$HOST:8776/v1/\$(tenant_id)s" --adminurl "http://$HOST:8776/v1/\$(tenant_id)s" --internalurl "http://$HOST:8776/v1/\$(tenant_id)s"
#glance
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 endpoint-create --region RegionOne --service_id $glance_service_id --publicurl "http://$HOST:9292/v1" --adminurl "http://$HOST:9292/v1" --internalurl "http://$HOST:9292/v1"
#keystone
keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 endpoint-create --region RegionOne --service_id $keystone_service_id --publicurl "http://$HOST:5000/v2.0" --adminurl "http://$HOST:35357/v2.0" --internalurl "http://$HOST:5000/v2.0"

keystone --os-token $ADMINTOKEN --os-endpoint http://$HOST:35357/v2.0 endpoint-list

