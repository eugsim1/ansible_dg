### create and dump a dataguard config for Exa servers

source exacs.env


export database_id=""
export compartment_id=""
export region=""

export database_admin_password=""
export peer_vm_cluster_id=""

ansible-playbook create_dg.yaml -vv \
--tags "Dump-vars" \
--tags "crete-data_guard_association" \
--tags "dbg-data_guard_association" \
--tags "write-data_guard_association" \
--extra-vars="database_id=$database_id" \
--extra-vars="database_admin_password=$database_admin_password" \
--extra-vars="region=$region" \
--extra-vars="peer_vm_cluster_id=$peer_vm_cluster_id" \
--extra-vars="database_id=$database_id" \
--extra-vars="local_dir=/home/oracle/oci4cca-managment/services/dataguard"

export data_guard_association_id=""
ansible-playbook dataguard_facts.yaml -vv \
--tags "Dump-vars" \
--tags "get-data_guard_association" \
--tags "dbg-data_guard_associati" \
--extra-vars="database_id=$database_id" \
--extra-vars="data_guard_association_id=$data_guard_association_id" \
--extra-vars="region=$region" 
