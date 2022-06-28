#!/bin/bash

# Public IP address
IP="104.41.207.154"

# Resource Group that contains AKS Node Pool
KUBERNETES_NODE_RG="MC_fabmedical-672791_fabmedical-672791_northeurope"

# Name to associate with public IP address
DNSNAME="fabmedical-672791-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --resource-group $KUBERNETES_NODE_RG --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME