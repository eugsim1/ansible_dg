**Create a dataguard association in the same region using ansible collections**  
  
The references of the setup and the prerequsites are given [here](https://docs.oracle.com/en-us/iaas/exadatacloud/exacs/using-data-guard-with-exacc.html#GUID-76913DF6-8BFA-4843-981F-A71C9F50D4A1)  
  
  
You can create and delete a dataguard associations using the scripts of this repository

You have to install the latest oci ansible ansible collections following all the steps from [here](https://docs.oracle.com/en-us/iaas/tools/oci-ansible-collection/5.3.0/installation/index.html)  
  
You have to configure a profile and export it from the exa.env file :  
  
  
```csharp
export OCI_CLI_CONFIG_FILE="full path to your configuration profile"
echo $OCI_CLI_CONFIG_FILE
export  OCI_CONFIG_PROFILE=DEFAULT
echo $OCI_CONFIG_PROFILE
export OCI_CONFIG_FILE=="full path to your configuration profile"
```


To create a dataguard association in the same region run the below script:  

```csharp
source exacs.env


export database_id="the ocid fo the source database from your exa""
export compartment_id="$EXA_VM_COMPARTMENT_ID" ## the ocid of compartment of your source cluster Exa export region="the region of the source database"

export database_admin_password="the_password_of_the_source_database"
export peer_vm_cluster_id="the ocid of the peer VM cluster that will host the target dataguard"

ansible-playbook create_dg.yaml  \
--tags "Dump-vars" \
--tags "create-data_guard_association" \
--tags "dbg-data_guard_association" \
--extra-vars="database_id=$database_id" \
--extra-vars="database_admin_password=$database_admin_password" \
--extra-vars="region=$region" \
--extra-vars="peer_vm_cluster_id=$peer_vm_cluster_id" \
--extra-vars="database_id=$database_id" \
--extra-vars="local_dir=/home/oracle/oci4cca-managment/services/dataguard"
```  
  
To get the facts of the dataguard association run the below script :  
  
  
```csharp
export data_guard_association_id="the data guard association that you want to get the facts"  

ansible-playbook dataguard_facts.yaml  \
--tags "Dump-vars" \
--tags "get-data_guard_association" \
--tags "dbg-data_guard_associati" \
--extra-vars="database_id=$database_id" \
--extra-vars="data_guard_association_id=$data_guard_association_id" \
--extra-vars="region=$region"
```
  
  
To delete an existing dataguard association use the below script:  
  

```csharp
source exacs.env
export database_id="the_source_database__dg_coidi"
export dg_database_id="the_target_database_dg_ocid"
export data_guard_association_id="the_dataguard_association_to_terminate"
export compartment_id="$EXA_VM_COMPARTMENT_ID"
export region="the region of the Exa cluster"

ansible-playbook terminate_dg.yaml  \
--tags "Dump-vars" \
--tags "Delete_database" \
--tags "dbg-DB" \
--extra-vars="database_id=$dg_database_id" \
--extra-vars="perform_final_backup=false" \
--extra-vars="region=$region" 

export data_guard_association_id=""
ansible-playbook dataguard_facts.yaml \
--tags "Dump-vars" \
--tags "get-data_guard_association" \
--tags "dbg-data_guard_associati" \
--extra-vars="database_id=$database_id" \
--extra-vars="data_guard_association_id=$data_guard_association_id" \
--extra-vars="region=$region"
```





