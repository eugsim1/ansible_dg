### terminate a DG configuration on Exa 

source exacs.env


export database_id=""
export dg_database_id=""
export compartment_id=""
export region=""

ansible-playbook terminate_dg.yaml -vv \
--tags "Dump-vars" \
--tags "Delete_database" \
--tags "dbg-DB" \
--tags "write-data_guard_association" \
--extra-vars="database_id=$dg_database_id" \
--extra-vars="perform_final_backup=false" \
--extra-vars="region=$region" 

export data_guard_association_id=""
ansible-playbook dataguard_facts.yaml -vv \
--tags "Dump-vars" \
--tags "get-data_guard_association" \
--tags "dbg-data_guard_associati" \
--extra-vars="database_id=$database_id" \
--extra-vars="data_guard_association_id=$data_guard_association_id" \
--extra-vars="region=$region" 
