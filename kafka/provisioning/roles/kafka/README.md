## Role Name

Installs and configures Kafka cluster on RHEL/CentOS 7/8 servers.

## Requirements

This installation requires Zookeeper; also note that this role requires root access, so either run it in a playbook with a global `become: yes`, or invoke the role in your playbook like:

    - hosts: all
      roles:
        - role: bilalcaliskan.kafka
          become: yes

If you have installed your Zookeeper servers seperately with Kafka brokers, then your playbook should look like that:

    - hosts: all
      roles:
        - role: bilalcaliskan.kafka
          become: yes

*Inside `vars/main.yml`*:

      zookeeper_host_group_name: $ZOOKEEPER_GROUP_NAME

*Setting variables in the playbook:

    - hosts: all
      roles:
        - role: bilalcaliskan.kafka
          become: yes
      vars:
        message: Your custom message here

## Attention

1- Do not forget to give that role a seperate inventory file with your target hosts, otherwise it will insall zookeeper on your all servers.

2- Consider changing below variable if you only want to use zookeeper with kafka
and you want your zookeeper nodes and kafka brokers to be seperately. If you want that,
your Kafka brokers and Zookeeper nodes must be in different groups in inventory file.
Change the below with the group name of zookeeper servers if you do not want to
setup zookeepers with the same servers with your kafka servers

    zookeeper_host_group_name: all

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

        kafka_version: 123.123

## Dependencies

        That role requires bilalcaliskan.zookeeper role

## Example Playbook

    - hosts: all
      become: yes
      roles:
        - { role: bilalcaliskan.kafka }

*Inside `vars/main.yml`*:

        kafka_version: 123.123

## License

MIT / BSD
