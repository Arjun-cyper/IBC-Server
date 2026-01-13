#!/bin/bash

rm -rf  ~/.relayer
rly config init

# Copy the config
cp -vf skud-skud.yaml ~/.relayer/config/config.yaml

ls -l ~/.relayer/config/config.yaml
cat ~/.relayer/config/config.yaml
rly keys delete chain1 ibc_user1 -y
rly keys delete chain2 ibc_user2 -y


IBC_USER1_SEED="nominee mushroom afraid exhaust antique myth beach excuse parrot silver nest focus project text rather oyster toast mind goose critic home extend plate meat"
IBC_USER2_SEED="print leaf inquiry toss pigeon jelly infant edit picnic term trick analyst spoil because window unfold come festival tent armed dance green combine answer" 

echo "Key $(rly keys restore chain1 ibc_user1 "$IBC_USER1_SEED") imported from chain1 network to relayer..."
echo "Key $(rly keys restore chain2 ibc_user2 "$IBC_USER2_SEED") imported from chain1 network to relayer..."


echo "list chains in rly configuration"
echo $(rly chains list)


# Establish connectin between the chain1 and chain2
rly transact link chain1-chain2


# # Comment the next line if your branch of skud doesn't have dlpcregistry module
# rly transact channel chain1-chain2 --src-port dlpcregistry --dst-port dlpcregistry  --version dlpcregistry-1

# Comment the next line if your branch of skud doesn't have fi module
rly transact channel chain1-chain2 --src-port trade --dst-port trade

rly start