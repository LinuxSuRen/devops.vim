" Vim syntax file
" Language: k8s
" Maintainer: SuRen

if exists("b:current_syntax")
  finish
endif

" Keywords
syntax keyword k8sCmd kubectl

syntax keyword k8sSubCmd create expose run set run-container get explain edit delete rollout rolling-update scale autoscale certificate cluster-info top cordon uncordon drain taint Troubleshooting describe logs attach exec port-forward proxy cp auth apply patch replace convert label annotate completion api-versions config help plugin version

syntax keyword k8sResources all certificatesigningrequests csr clusterrolebindings clusterroles componentstatuses cs configmaps cm controllerrevisions cronjobs customresourcedefinition crd daemonsets ds deployments deploy endpoints ep events ev horizontalpodautoscalers hpa ingresses ing jobs limitranges limits namespaces ns networkpolicies netpol nodes no persistentvolumeclaims pvc persistentvolumes pv poddisruptionbudgets pdb podpreset pods po podsecuritypolicies psp podtemplates replicasets rs replicationcontrollers rc resourcequotas quota rolebindings roles secrets serviceaccounts sa services svc statefulsets sts storageclasses sc

" Highlighting
highlight link k8sCmd Function
highlight link k8sSubCmd Keyword
highlight link k8sResources String
