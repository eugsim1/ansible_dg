### get DG facts from an Exa config

source exacs.env


export database_id=""
export compartment_id=""
export region=""



ansible-playbook dataguard_facts.yaml -vv \
--tags "Dump-vars" \
--tags "list-data_guard_association" \
--tags "dbg-data_guard_associati" \
--tags "write-data_guard_association" \
--extra-vars="database_id=$database_id" \
--extra-vars="region=$region" \
--extra-vars="local_dir=/home/oracle/oci4cca-managment/services/dataguard"

export data_guard_association_id=""
ansible-playbook dataguard_facts.yaml -vv \
--tags "Dump-vars" \
--tags "get-data_guard_association" \
--tags "dbg-data_guard_associati" \
--extra-vars="database_id=$database_id" \
--extra-vars="data_guard_association_id=$data_guard_association_id" \
--extra-vars="region=$region" 
