# Priviliged PSA for Namespaces


This mutation policy will add a label to every ns that is created. The label will allow for priviliged pods in that namespace. this effectively overrides the PSA settings globally becuase it's being added to all namespaces. 