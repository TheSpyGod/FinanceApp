import subprocess

# Function to run PowerShell script
def run_powershell_script(ps_script_path):
    command = ['powershell.exe', '-ExecutionPolicy', 'Bypass', '-File', ps_script_path]
    try:
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        # Print only the output from PowerShell script, suppressing verbose warnings
        print("PowerShell Output:\n", result.stdout.strip())
        if result.stderr.strip():
            print("PowerShell Error Output:\n", result.stderr.strip())
    except subprocess.CalledProcessError as e:
        print("Error occurred while running the PowerShell script.")
        print("PowerShell Output:\n", e.stdout.strip())
        print("PowerShell Error Output:\n", e.stderr.strip())

# Function to run mongosh script
def run_mongosh_script(mongosh_script_path):
    command = ['mongosh', mongosh_script_path]
    try:
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        # Print only the output from mongosh script
        print("mongosh Output:\n", result.stdout.strip())
        if result.stderr.strip():
            print("mongosh Error (if any):\n", result.stderr.strip())
    except subprocess.CalledProcessError as e:
        print("Error occurred while running the mongosh script.")
        print("mongosh Output:\n", e.stdout.strip())
        print("mongosh Error Output:\n", e.stderr.strip())

# Paths to scripts
ps_script_path = 'install.ps1'
mongosh_script_path = 'collection.js'

# Run PowerShell script to install MongoDB and mongosh if not already installed
run_powershell_script(ps_script_path)

# Run mongosh script to create database and collection
run_mongosh_script(mongosh_script_path)
