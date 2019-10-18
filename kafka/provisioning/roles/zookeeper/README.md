## Role Name

Installs and configures Zookeeper cluster on RHEL/CentOS 7/8 servers.

## Requirements

No special requirements; note that this role requires root access, so either run it in a playbook with a global `become: yes`, or invoke the role in your playbook like:

    - hosts: all
      roles:
        - role: bilalcaliskan.zookeeper
          become: yes

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

        zookeeper_version: 123.123

## Dependencies

None

## Example Playbook

    - hosts: all
      become: yes
      roles:
        - { role: bilalcaliskan.zookeeper }

*Inside `vars/main.yml`*:

        zookeeper_version: 123.123

## License

MIT / BSD
