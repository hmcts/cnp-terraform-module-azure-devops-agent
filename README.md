# Terraform Module - Azure DevOps Agent
This module was created to simplify the deployment of an Azure DevOps Self Hosted Agent, this module creates a Virtual Machine Scale Set based on the [devops-packer](https://github.com/hmcts/azure-devops-packer) image (a custom image can be used if required) and sets up the required peerings and routes with all HMCTS Hubs.


**Resources Created**:
- Virtual Network
- Subnet
- Network Security Group
- Route Table
- Virtual Network Peerings
  - hmcts-hub-prod-int
  - ukw-hub-prod-int
  - hmcts-hub-nonprodi 
  - ukw-hub-nonprodi
  - hmcts-hub-sbox-int 
  - core-infra-vnet-mgmt
- DNS Links
- Azure Key Vault
- Virtual Machine Scale Set

## Passing Providers
To use this module, you MUST pass the providers stated below via the parent module, this module uses multiple providers to setup peerings and dns links, information on how to do pass the providers via the parent module can be found in [examples](examples) or https://developer.hashicorp.com/terraform/language/modules/develop/providers#providers-within-modules.

## Contributing
For any improvements or to add new features, please open a [Pull Request](https://github.com/hmcts/terraform-module-azure-devops-agent/compare) which will be reviewed by a member of the team.

## Examples 
An example on how to use this module can be found [here](examples).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.40.0 |
| <a name="provider_azurerm.current_peering"></a> [azurerm.current\_peering](#provider\_azurerm.current\_peering) | >= 3.40.0 |
| <a name="provider_azurerm.dns"></a> [azurerm.dns](#provider\_azurerm.dns) | >= 3.40.0 |
| <a name="provider_azurerm.image_gallery"></a> [azurerm.image\_gallery](#provider\_azurerm.image\_gallery) | >= 3.40.0 |
| <a name="provider_azurerm.mgmt_peering"></a> [azurerm.mgmt\_peering](#provider\_azurerm.mgmt\_peering) | >= 3.40.0 |
| <a name="provider_azurerm.nonprod_peering"></a> [azurerm.nonprod\_peering](#provider\_azurerm.nonprod\_peering) | >= 3.40.0 |
| <a name="provider_azurerm.prod_peering"></a> [azurerm.prod\_peering](#provider\_azurerm.prod\_peering) | >= 3.40.0 |
| <a name="provider_azurerm.sbox_peering"></a> [azurerm.sbox\_peering](#provider\_azurerm.sbox\_peering) | >= 3.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.vmss-ssh-private-key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.vmss-ssh-public-key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_linux_virtual_machine_scale_set.vmss](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.AllowF5VPN](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.DenyAzureLoadBalancerInbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.DenyVirtualNetworkInbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_route.ss-demo-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.ss-dev-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.ss-ithc-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.ss-prod-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.ss-sbox-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.ss-stg-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.ss-test-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_route_table_association.subnet_route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.core-infra-vnet-mgmt_TO_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.hmcts-hub-prod-int_TO_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.hmcts-hub-sbox-int_TO_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.hmcts_hub_nonprodi_TO_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.ukw-hub-prod-int_TO_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.ukw_hub_nonprodi_TO_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet_TO_hubs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [tls_private_key.vmss](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_shared_image.devops-ubuntu](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/shared_image) | data source |
| [azurerm_virtual_network.core-infra-vnet-mgmt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.hmcts-hub-nonprodi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.hmcts-hub-prod-int](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.hmcts-hub-sbox-int](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.ukw-hub-nonprodi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.ukw-hub-prod-int](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | dns servers given to the virtual network | `list(string)` | `[]` | no |
| <a name="input_dns_zones"></a> [dns\_zones](#input\_dns\_zones) | list of private dns zone names to link to virtual network | `list(string)` | `[]` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | [REQUIRED] - name given to key vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | [REQUIRED] - location to create resources | `string` | n/a | yes |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | name given to the nsg | `string` | n/a | yes |
| <a name="input_peering_client_id"></a> [peering\_client\_id](#input\_peering\_client\_id) | [REQUIRED] - client id with peering access | `string` | n/a | yes |
| <a name="input_peering_client_secret"></a> [peering\_client\_secret](#input\_peering\_client\_secret) | [REQUIRED] - client secret with peering access | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | [REQUIRED] - resource group to create resources | `string` | n/a | yes |
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | [REQUIRED] - name given to route table | `string` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | list of service endpoints assigned to subnet | `list(string)` | `[]` | no |
| <a name="input_subnet_address_prefix"></a> [subnet\_address\_prefix](#input\_subnet\_address\_prefix) | [REQUIRED] - address prefix given to subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | [REQUIRED] - name given to subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | [REQUIRED] - azure tags | `map(string)` | n/a | yes |
| <a name="input_vmss_admin_username"></a> [vmss\_admin\_username](#input\_vmss\_admin\_username) | username for admin account on virtual machine scale set | `string` | `"adoagent"` | no |
| <a name="input_vmss_instance_count"></a> [vmss\_instance\_count](#input\_vmss\_instance\_count) | virtual machine scale set instance count (usually managed via Azure DevOps) | `number` | `1` | no |
| <a name="input_vmss_name"></a> [vmss\_name](#input\_vmss\_name) | [REQUIRED] - name given to virtual machine scale set | `string` | n/a | yes |
| <a name="input_vmss_sku"></a> [vmss\_sku](#input\_vmss\_sku) | sku for virtual machine scale set | `string` | `"Standard_D4s_v4"` | no |
| <a name="input_vmss_source_image_id"></a> [vmss\_source\_image\_id](#input\_vmss\_source\_image\_id) | the id of an image which the virtual machine scale set should be based on | `string` | `null` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | [REQUIRED] - address space given to the virtual network | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | [REQUIRED] - name given to the virtual network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | n/a |
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | n/a |
| <a name="output_nsg_name"></a> [nsg\_name](#output\_nsg\_name) | n/a |
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | n/a |
| <a name="output_subnet_address_prefixes"></a> [subnet\_address\_prefixes](#output\_subnet\_address\_prefixes) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | n/a |
| <a name="output_vmss_id"></a> [vmss\_id](#output\_vmss\_id) | n/a |
| <a name="output_vmss_name"></a> [vmss\_name](#output\_vmss\_name) | n/a |
| <a name="output_vnet_address_guid"></a> [vnet\_address\_guid](#output\_vnet\_address\_guid) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |