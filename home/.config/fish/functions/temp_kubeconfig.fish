function temp_kubeconfig
  # Create a temporary kubeconfig file
  set file (mktemp -t "kubectx.XXXXXX")

  # Copy existing kubeconfig content into the temporary file
  cat $HOME/.kube/config > $file

  # Set the KUBECONFIG environment variable for this session
  set -gx KUBECONFIG "$file"

  # Print a message to let the user know what's happening
  echo "Created temporary kubeconfig file: $file"
  echo "Set KUBECONFIG environment variable to: $KUBECONFIG"
  echo "Using namespace $argv[1]"

  # Set the namespace for the current context
  kubectl config set-context --current --namespace="$argv[1]"
end

