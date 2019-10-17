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
