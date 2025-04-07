## Unauthenticated scan for Windows 10 Homelab Tutorial 

Virtual machines (VMs) used are provisioned with Azure services

Unauthenticated scans are used to identify vunerabilities within a system or network without requiring login credentials or access privileges
This scan focuses on: open ports, unpatched software, and weak configurations
The idea is to simulate what an outsider may see when trying to attack a system

### What you'll need to do for this lab:

win + r + wf.msc, and disable VM's firewall
Ensure your NSG within Azure also allows all traffic inbound

Ping the public IP of the VM from your local host to ensure it is accessible from the internet (This is just for the lab)
(If the ping isn't replying this is an indicator that the scan may not work)

Next log into Tenable

- Go to "Scans"
- Select **"Basic Network Scan"**

![image](https://github.com/user-attachments/assets/f2d86dcb-488c-4371-ad4a-0e0a9f118d4a)

 Within Settings/**"Basic"**
- Name your scan
- Scanner type for "internal scanner" we use a VM in Azure, so this would require a private IP address under "targets"
- If you're using "Tenable's cloud" scanner, you would use your public IP adress under "targets"


 
 Next you'll go to the **Discovery** tab
- Scan Type "Custom"
- ✔️ Ping the remote host
- ✔️ Use fast network discovery

Normally you'd add credentials, but for an unauthenticated scan you're done

Click launch, and wait 15-18 minutes to conduct the scan
If the scan conducts within 1 minutes or too fast this is a sign that the VM/host is unreachable or there is a misconfiguration 

Click "See all Details"
- **"Vulns by Plugin"**
- Organize by severity level
- Export / PDF - Executive Summary

![image](https://github.com/user-attachments/assets/039c3a98-ca67-419d-b888-a91e78be9f62)

