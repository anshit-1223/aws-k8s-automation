#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

CONTROL_IP=$(terraform output -json master-node | jq -r '.public_ip')
WORKER_IPS=$(terraform output -json worker-node-public_ip)

SSH_USER="ubuntu"
SSH_KEY="$HOME/keypair/k8s/k8s-keypair"
INVENTORY="ansible/inventory.ini"

mkdir -p ansible

cat > "$INVENTORY" <<EOF
[control_plane]
k8s-control ansible_host=${CONTROL_IP}

[workers]
EOF

python3 - "$WORKER_IPS" "$SSH_USER" "$SSH_KEY" >> "$INVENTORY" <<'PY'
import json
import sys

ips = json.loads(sys.argv[1])
user = sys.argv[2]
key = sys.argv[3]

for i, ip in enumerate(ips, 1):
    print(f"k8s-worker-{i} ansible_host={ip}")

print()
print("[k8s_cluster:children]")
print("control_plane")
print("workers")
print()
print("[k8s_cluster:vars]")
print(f"ansible_user={user}")
print(f"ansible_ssh_private_key_file={key}")
print("ansible_python_interpreter=/usr/bin/python3")
ansible_host_key_checking=False
PY

echo "Generated inventory:"
cat "$INVENTORY"

# Create the SSH known_hosts directory
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

touch "$HOME/.ssh/known_hosts"
chmod 600 "$HOME/.ssh/known_hosts"

# Add host keys for the EC2 instances
ssh-keyscan -H "$CONTROL_IP" >> "$HOME/.ssh/known_hosts"

for IP in $(echo "$WORKER_IPS" | jq -r '.[]'); do
    ssh-keyscan -H "$IP" >> "$HOME/.ssh/known_hosts"
done

echo "Host Authentication Set to Yes"