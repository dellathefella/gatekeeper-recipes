package kubernetes.admission

operations = {"DELETE"}

import input.request.object.metadata.annotations as annotations

#Take networkpolicy as input
violation[reason] {
	input.request.kind.kind == "NetworkPolicy"
    operations[input.request.operation]
    missing_required_annotations[reason]
}

# Require no "protected" annotation or protected="no" to allow network policy deletion 
missing_required_annotations[reason] {
    annotation = input.request.object.metadata.annotations["protected"]
    not annotation = "no"
    reason = "This network policy is protected by policy or protected flag is missing."
}